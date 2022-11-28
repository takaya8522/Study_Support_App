Rails.application.routes.draw do
  # devise lineログインのため
  devise_for :users, controllers: {
    omniauth_callbacks: "omniauth_callbacks"
  }
  root 'study_records#index'
  resources :study_records, only: [:index, :create, :new, :edit, :show, :update, :destroy]
end
