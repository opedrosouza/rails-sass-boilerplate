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
  devise_for :admins,
             path: "admin/auth",
             class_name: "Admin",
             controllers: {
               sessions: "admin/auth/sessions",
               confirmations: "admin/auth/confirmations",
               passwords: "admin/auth/passwords",
               unlocks: "admin/auth/unlocks"
             }


  # Admin routes
  devise_scope :admin do
    authenticated :admin do
      root "admin/home#index", as: :admin_root

      namespace :admin do
        resources :accounts
      end
    end

    unauthenticated do
      root "pages#home", as: :unauthenticated_admin_root
    end
  end

  # APP routes
  devise_scope :user do
    authenticated :user do
      root "home#index", as: :authenticated_root
    end

    unauthenticated do
      root "pages#home", as: :unauthenticated_root
    end
  end

  # Static pages
  root "pages#home"
end
