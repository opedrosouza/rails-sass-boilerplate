# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

gem "bootsnap", require: false
gem "devise"
gem "devise-i18n"
gem "dotenv-rails"
gem "image_processing"
gem "money"
gem "pagy"
gem "pg"
gem "pg_search"
gem "puma"
gem "pundit"
gem "rack-cors"
gem "rails", "~> 8.0", ">= 8.0.2.1"
gem "rails-i18n"
gem "stimulus-rails"
gem "turbo-rails"
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]
gem "vite_rails"

group :development, :test do
  gem "awesome_print"
  gem "brakeman", require: false
  gem "debug", platforms: %i[mri mingw x64_mingw]
  gem "factory_bot_rails"
  gem "faker"
  gem "rubocop-rails-omakase", require: false
end

group :test do
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
