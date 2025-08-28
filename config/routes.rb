# frozen_string_literal: true

# Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

Rails.application.routes.draw do
  # Devise routes
  devise_for :users,
             controllers: {
               sessions: "users/sessions",
               confirmations: "users/confirmations",
               passwords: "users/passwords",
               unlocks: "users/unlocks",
               registrations: "users/registrations"
             }

  # APP routes
  devise_scope :user do
    authenticated :user do
      resource :users, path: "profile", as: :profile

      root "home#index", as: :authenticated_root
    end

    unauthenticated do
      root "pages#home", as: :unauthenticated_root
    end
  end

  # Static pages
  root "pages#home"
end
