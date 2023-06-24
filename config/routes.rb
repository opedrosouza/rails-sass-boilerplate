# frozen_string_literal: true
# Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

Rails.application.routes.draw do
  namespace :storefront do
    get 'home/index'
  end
  devise_for :users,
             path: "auth",
             class_name: "User",
             controllers: {
               sessions: "users/sessions",
               confirmations: "users/confirmations",
               invitations: "users/invitations",
               passwords: "users/passwords",
               unlocks: "users/unlocks",
               registrations: "users/registrations",
             }

  devise_scope :user do
    authenticated :user do
      root to: "home#index", as: :authenticated_root
    end

    unauthenticated do
      root "users/sessions#new", as: :unauthenticated_root
    end
  end

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

  root to: "users/sessions#new"
end
