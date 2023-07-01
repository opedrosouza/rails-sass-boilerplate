# frozen_string_literal: true
unless Rails.env.production?
  password = "password"
  # Create an admin user
  Rails.logger.debug "Creating an admin user"
  User.create!(
    first_name: "Admin",
    last_name: "User",
    email: "admin@example.com",
    password:,
    password_confirmation: password,
    confirmed_at: Time.current,
  )

  # Create a regular user
  Rails.logger.debug "Creating a regular user"
  User.create!(
    first_name: "Simple",
    last_name: "User",
    email: "user@example.com",
    password:,
    password_confirmation: password,
    confirmed_at: Time.current,
  )

  # Create ouath applications
  # if there is no OAuth application created, create them
  if Doorkeeper::Application.count.zero?
    Rails.logger.debug "Creating oauth applications"
    Doorkeeper::Application.create(name: "iOS client", redirect_uri: "", scopes: "")
    Doorkeeper::Application.create(name: "Android client", redirect_uri: "", scopes: "")
  end
end
