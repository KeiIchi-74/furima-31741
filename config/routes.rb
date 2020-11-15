Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :items do
    resources :orders, only: [:index, :create]
    resource :favorites, only: [:create, :destroy]
    resource :reports, only: [:create, :destroy]
  end
  resources :users, only: :show do
    resource :relationships, only: [:create, :destroy]
    get :follow, on: :member
  end
  resources :categories, only: :index
end
