# Utilisation de l'image Ruby officielle
FROM ruby:3.2.2

# Configuration du dossier de l'application
WORKDIR /app

# Installation des dépendances système
RUN apt-get update -qq && apt-get install -y \
  libpq-dev curl git libicu-dev build-essential imagemagick p7zip-full && \
  curl https://deb.nodesource.com/setup_18.x | bash && \
  apt-get install -y nodejs \
&& rm -rf /var/lib/apt/lists/* \
&& apt-get clean

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
&& echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
&& apt-get update -qq \
&& apt-get install -y yarn

# Installation de Bundler
RUN gem install bundler -v 2.4.6

# Copier et installer les dépendances Ruby (Gemfile)
COPY Gemfile Gemfile.lock ./
RUN bundle config set --local without 'development test' && bundle install

COPY package.json ./
RUN yarn install --frozen-lockfile

# Copie des fichiers de l'application
COPY . . 

# Exposer le port 3000
EXPOSE 3000

# Set environment variables for Rails
ENV RAILS_ENV=production \
    SECRET_KEY_BASE=89c30ebf46a00a5b839d072215dd7d36ce31161f3908421083c2349eb1ffaf3596be516d14c301df5528ceefcce192819047c83d8b7acad5ddc6480bde1fc655 \
    DATABASE_URL=postgresql://stgabriel_decidim:Gab2495decidim@db:5432/db_decidim \
    RAILS_LOG_TO_STDOUT=true \
    RAILS_SERVE_STATIC_FILES=true

RUN bundle exec rails assets:precompile

RUN rm -rf node_modules tmp/cache vendor/bundle spec \
    && rm -rf /usr/local/bundle/cache/*.gem \
    && find /usr/local/bundle/gems/ -name "*.c" -delete \
    && find /usr/local/bundle/gems/ -name "*.o" -delete \
    && find /usr/local/bundle/gems/ -type d -name "spec" -prune -exec rm -rf {} \; \
    && rm -rf log/*.log

CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]