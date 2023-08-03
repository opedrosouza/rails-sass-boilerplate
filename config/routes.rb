# frozen_string_literal: true
# Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

Rails.application.routes.draw do
  # Devise routes
  devise_for :users,
             path: "auth",
             class_name: "User",
             controllers: {
               sessions: "auth/sessions",
               confirmations: "auth/confirmations",
               invitations: "auth/invitations",
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

  # Admin routes

  namespace :admin do
    resources :users do
      member do
        patch :lock
        patch :unlock
        patch :restore
      end
    end

    resources :accounts do
      member do
        patch :restore
      end
    end

    root to: "home#index"
  end

  root to: "home#index"
end
