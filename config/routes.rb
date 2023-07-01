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

  devise_scope :user do
    authenticated :user do
      root to: "app/home#index", as: :authenticated_root
    end

    unauthenticated do
      root "storefront/home#index", as: :unauthenticated_root
    end
  end

  # App routes

  namespace :app do
    root to: "home#index"
  end

  # API routes

  scope :api do
    use_doorkeeper do
      skip_controllers :authorizations, :applications, :authorized_applications
    end
  end

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :users, only: [:create] do
        collection do
          get :me, to: "users#show"
        end
      end
    end
  end

  root to: "storefront/home#index"
end
