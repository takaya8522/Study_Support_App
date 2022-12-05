Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root "homes#top"
  get "homes/about", to: "homes#about"
  get "homes/index", to: "homes#index"
  
  # devise lineログインのため
  devise_for :users, controllers: {
    omniauth_callbacks: "omniauth_callbacks"
  }
  
  resources :users, only: %i[show edit update destroy] do
    resources :study_records
    resources :categories, only: %i[index create new edit update destroy]
  end
end
