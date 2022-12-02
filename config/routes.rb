Rails.application.routes.draw do
  root "homes#top"
  get "homes/about", to: "homes#about"
  get "homes/index", to: "homes#index"
  # devise lineログインのため
  devise_for :users, controllers: {
    omniauth_callbacks: "omniauth_callbacks"
  }
  resources :study_records, only: %i[index create new edit show update destroy]
  resources :users, only: %i[show edit update destroy]
end
