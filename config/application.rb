# frozen_string_literal: true

require_relative "boot"

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_text/engine"
require "action_view/railtie"
require "action_cable/engine"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Boilerplate

  class Application < Rails::Application

    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    config.generators do |g|
      g.test_framework :rspec
    end

    # Permitted locales available for the application
    config.i18n.available_locales = %w[en]
    # Set default locale
    config.i18n.default_locale = "en"
    # Use default language as fallback if translation is missing
    config.i18n.fallbacks = true

    # Don't generate system test files.
    config.generators.system_tests = nil

  end

end
