# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.3.4"
gem "bootsnap", require: false
gem "devise", "~> 4.9", ">= 4.9.4"
gem "devise-i18n", "~> 1.12", ">= 1.12.1"
gem "dotenv-rails", "~> 3.1", ">= 3.1.2"
gem "image_processing", "~> 1.12", ">= 1.12.2"
gem "money", "~> 6.19"
gem "pagy", "~> 9.0", ">= 9.0.9"
gem "pg", "~> 1.5", ">= 1.5.8"
gem "pg_search", "~> 2.3", ">= 2.3.7"
gem "puma", "~> 6.5"
gem "pundit", "~> 2.4"
gem "rack-cors", "~> 2.0", ">= 2.0.2"
gem "rails", "~> 7.2", ">= 7.2.2"
gem "rails-i18n", "~> 7.0", ">= 7.0.9"
gem "stimulus-rails"
gem "turbo-rails"
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]
gem "vite_rails", "~> 3.0", ">= 3.0.17"

group :development, :test do
  gem "awesome_print"
  gem "brakeman", require: false
  gem "debug", platforms: %i[mri mingw x64_mingw]
  gem "factory_bot_rails"
  gem "faker"
  gem "rubocop-performance"
  gem "rubocop-rails"
  gem "rubocop-rspec"
end

group :test do
  gem "capybara"
  gem "database_cleaner-active_record"
  gem "rails-controller-testing"
  gem "rspec-rails"
  gem "shoulda-matchers"
  gem "simplecov"
end

group :development do
  gem "annotate"
  gem "letter_opener"
  gem "web-console"
end
