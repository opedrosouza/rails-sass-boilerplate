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
    role: :admin,
  )
end
