# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.3.4"
gem "active_model_serializers", "~> 0.10.14"
gem "bootsnap", require: false
gem "devise", "~> 4.9", ">= 4.9.4"
gem "devise-i18n", "~> 1.12", ">= 1.12.1"
gem "discard", "~> 1.3"
gem "doorkeeper", "~> 5.7", ">= 5.7.1"
gem "dotenv-rails", "~> 3.1", ">= 3.1.2"
gem "image_processing", "~> 1.12", ">= 1.12.2"
gem "money", "~> 6.19"
gem "pagy", "~> 9.0", ">= 9.0.9"
gem "pg", "~> 1.5", ">= 1.5.8"
gem "pg_search", "~> 2.3", ">= 2.3.7"
gem "puma", "~> 6.4", ">= 6.4.2"
gem "pundit", "~> 2.4"
gem "rack-cors", "~> 2.0", ">= 2.0.2"
gem "rails", "~> 7.2", ">= 7.2.1"
gem "rails-i18n", "~> 7.0", ">= 7.0.9"
gem "stimulus-rails", "~> 1.3", ">= 1.3.4"
gem "turbo-rails", "~> 2.0", ">= 2.0.6"
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]
gem "vite_rails", "~> 3.0", ">= 3.0.17"

group :development, :test do
  gem "awesome_print", "~> 1.9", ">= 1.9.2"
  gem "brakeman", require: false
  gem "debug", platforms: %i[mri mingw x64_mingw]
  gem "factory_bot_rails", "~> 6.4", ">= 6.4.3"
  gem "faker", "~> 3.4", ">= 3.4.1"
  gem "rubocop-performance", "~> 1.21"
  gem "rubocop-rails", "~> 2.26"
  gem "rubocop-rspec", "~> 3.0", ">= 3.0.5"
end

group :test do
  gem "capybara", "~> 3.40"
  gem "database_cleaner-active_record", "~> 2.2"
  gem "rails-controller-testing", "~> 1.0", ">= 1.0.5"
  gem "rspec-rails", "~> 6.1", ">= 6.1.2"
  gem "shoulda-matchers", "~> 6.2"
  gem "simplecov", "~> 0.22.0"
end

group :development do
  gem "annotate", "~> 3.2"
  gem "letter_opener", "~> 1.10"
  gem "web-console"
end
