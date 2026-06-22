Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :tickets, only: [:index, :show, :create, :update, :destroy]
      get "tickets/index"
      get "tickets/show"
    end
  end
  get "dashboard", to: "dashboard#index"

  resources :notifications, only: [:index]

  resources :tickets do
    resources :comments, only: [:create, :destroy]
  end

  root to: redirect("/users/sign_in")

  devise_for :users

  get "up" => "rails/health#show", as: :rails_health_check
end