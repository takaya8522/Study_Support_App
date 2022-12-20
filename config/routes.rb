Rails.application.routes.draw do
  root "homes#top"
  # 学習理解度を更新するため
  patch 'users/:id/change_comprehension' => 'completes#change_comprehension', as: 'change_comprehension'
  
  # devise lineログイン、ゲストログイン機能のため
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  # ゲストログイン用
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
    post 'users/guest_admin_sign_in', to: 'users/sessions#guest_admin_sign_in'
  end
  
  resources :users, only: %i[show edit update destroy] do
    resources :categories, only: %i[index create update destroy]
    resources :study_records
    resources :completes, only: %i[index show]
    resources :review_counts, only: %i[update]
  end

  # 管理者用ページ用
  namespace :admin do
    resources :users
  end
end
