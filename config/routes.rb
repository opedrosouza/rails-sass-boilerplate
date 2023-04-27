# frozen_string_literal: true
# Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

Rails.application.routes.draw do
  devise_for :users,
             path: "",
             class_name: "User",
             controllers: {
               sessions: "users/sessions",
               confirmations: "users/confirmations",
               invitations: "users/invitations",
               passwords: "users/passwords",
               unlocks: "users/unlocks",
               registrations: "users/registrations",
             },
             path_names: {
               sign_in: "entrar",
               sign_out: "sair",
               password: "senha",
               confirmation: "confirmar",
               unlock: "desbloquear",
               sign_up: "criar-conta",
             }

  devise_scope :user do
    authenticated :user do
      root to: "home#index", as: :authenticated_root
    end

    unauthenticated do
      root "users/sessions#new", as: :unauthenticated_root
    end
  end

  root to: "users/sessions#new"
end
