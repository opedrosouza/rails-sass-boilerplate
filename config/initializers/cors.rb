# frozen_string_literal: true
Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins "*"
    resource "/api/*",
             headers: :any,
             methods: %i[get post delete put patch options head]
  end
end
