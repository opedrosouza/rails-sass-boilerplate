# frozen_string_literal: true
unless Rails.env.production?
  password = "password"
  # Create the default admin user
  Rails.logger.debug "Creating an sudo admin user"
  Admin.find_or_create_by(
    first_name: "Admin",
    last_name: "User",
    email: "admin@example.com",
    password:,
    password_confirmation: password,
    confirmed_at: Time.current,
  )

  # Create a regular user
  Rails.logger.debug "Creating a regular user"
  user = User.find_or_create_by(
    first_name: "Simple",
    last_name: "User",
    email: "user@example.com",
    password:,
    password_confirmation: password,
    confirmed_at: Time.current,
  )

  user.owned_accounts.last.active!

  # Create some plans
  Rails.logger.debug "Creating plans"
  Plan.find_or_create_by(name: "Free", price_in_cents: 0)
  Plan.find_or_create_by(name: "Basic", price_in_cents: 10_00)
end
