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
               passwords: "auth/passwords",
               unlocks: "auth/unlocks",
               registrations: "auth/registrations"
             }

  # APP routes
  devise_scope :user do
    authenticated :user do
      resource :users, path: "profile", as: :profile

      namespace :admin do
        resources :accounts
        get "/", to: "home#index", as: :root
      end

      root "home#index", as: :authenticated_root
    end

    unauthenticated do
      root "pages#home", as: :unauthenticated_root
    end
  end

  # Static pages
  root "pages#home"
end
