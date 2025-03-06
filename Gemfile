# frozen_string_literal: true

source "https://rubygems.org"

ruby RUBY_VERSION

DECIDIM_VERSION = "0.29.2"

gem "decidim", "#{DECIDIM_VERSION}"
gem "decidim-conferences", "#{DECIDIM_VERSION}"
gem "decidim-initiatives", "#{DECIDIM_VERSION}"
gem "decidim-design", "#{DECIDIM_VERSION}"
gem "decidim-templates", "#{DECIDIM_VERSION}"
# gem "decidim-accountability", "#{DECIDIM_VERSION}"
gem "decidim-assemblies", "#{DECIDIM_VERSION}"
# gem "decidim-blogs", "#{DECIDIM_VERSION}"
# gem "decidim-budgets", "#{DECIDIM_VERSION}"
gem "decidim-proposals", "#{DECIDIM_VERSION}"

gem "omniauth-decidim", "0.2.1"

# Performance et serveur d’application
gem "bootsnap", "~> 1.3"
gem "puma", ">= 6.3.1"

# Base de données et cache
gem "redis", "~> 4.0" # Cache & Sidekiq

# Géolocalisation
gem "geocoder", "~> 1.8.0"

# Génération de PDF
gem "wkhtmltopdf-binary", "0.12.6.6"

group :development, :test do
  gem "byebug", "~> 11.0", platform: :mri

  gem "brakeman", "~> 6.1"
  gem "decidim-dev", "#{DECIDIM_VERSION}"
  gem "net-imap", "~> 0.2.3"
  gem "net-pop", "~> 0.1.1"
  gem "net-smtp", "~> 0.3.1"
end

group :development do
  gem "letter_opener_web", "~> 2.0"
  gem "listen", "~> 3.1"
  gem "web-console", "~> 4.2"
end

group :production do
  gem "rack-attack"
  gem "lograge"
  gem "sentry-rails"
  gem "sentry-sidekiq"
  gem "rails-autoscale-web"
  gem "scout_apm"
  gem "dalli"
  gem "excon", ">= 0.71.0"
  gem "sidekiq"
end
