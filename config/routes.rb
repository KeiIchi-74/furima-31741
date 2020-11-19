Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: "users/omniauth_callbacks",
    registrations: "users/registrations"
  }
  root to: "items#index"
  resources :items do
    resources :orders, only: [:index, :create]
    resource :favorites, only: [:create, :destroy]
    resource :reports, only: [:create, :destroy]
    resources :messages, only: :create
  end
  resources :users, only: :show do
    resource :relationships, only: [:create, :destroy]
    get :follow, on: :member
  end
  resources :categories, only: [:index, :show]
  resources :signups, only: :index
end
