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
               registrations: "auth/registrations",
             }
  devise_for :admins,
             path: "admin/auth",
             class_name: "Admin",
             controllers: {
               sessions: "admin/auth/sessions",
               confirmations: "admin/auth/confirmations",
               passwords: "admin/auth/passwords",
               unlocks: "admin/auth/unlocks",
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

  # App routes
  namespace :app do
    root to: "home#index"
  end

  # Admin routes
  namespace :admin do
    resources :accounts
    root to: "home#index"
  end

  root to: "storefront/home#index"
end
