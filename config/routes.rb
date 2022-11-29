Rails.application.routes.draw do
  root 'study_records#index'
  resources :study_records, only: [:index, :create, :new, :edit, :show, :update, :destroy]
end
