# frozen_string_literal: true

RSpec.configure do |config|
  config.include Devise::Test::IntegrationHelpers
  config.include Devise::Test::ControllerHelpers, type: :controller
  config.include Devise::Test::ControllerHelpers, type: :view

  config.before(:suite) do
    Devise.mappings[:user] ||= Devise::Mapping.find_scope!(:user)
  end
end
