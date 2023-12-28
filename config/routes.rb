# frozen_string_literal: true
# Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

Rails.application.routes.draw do
  # Development routes
  if Rails.env.development?
    mount Lookbook::Engine, at: "/lookbook"
  end

  # Devise routes
  devise_for :users,
             path: "auth",
             class_name: "User",
             controllers: {
               sessions: "auth/sessions",
               confirmations: "auth/confirmations",
               passwords: "auth/passwords",
               unlocks: "auth/unlocks",
               registrations: "auth/registrations",
             }

  # Example of how to use devise_scope to change the default path of the routes
  # devise_scope :user do
  #   authenticated :user do
  #     root to: "app/home#index", as: :authenticated_root
  #   end

  #   unauthenticated do
  #     root "storefront/home#index", as: :unauthenticated_root
  #   end
  # end

  # API routes
  scope :api do
    use_doorkeeper do
      skip_controllers :authorizations, :applications, :authorized_applications
      controllers tokens: "api/auth/tokens"
    end
  end

  namespace :api, defaults: { format: :json } do
    namespace :auth do
      resources :registrations, only: [:create]
    end
  end

  # App routes
  namespace :app do
    root to: "home#index"
  end

  # Admin routes
  namespace :admin do
    root to: "home#index"
  end

  root to: "storefront/home#index"
end
