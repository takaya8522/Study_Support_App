Rails.application.routes.draw do
  root "homes#index"
  get "homes/about", to: "homes#about"
  # devise lineログインのため
  devise_for :users, controllers: {
    omniauth_callbacks: "omniauth_callbacks"
  }
  resources :study_records, only: %i[index create new edit show update destroy]
  resources :users, only: %i[show]
end
