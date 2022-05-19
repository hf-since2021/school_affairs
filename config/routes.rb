Rails.application.routes.draw do
  root to: "users#index"

  # ユーザー管理系
  resources :users, only: [:index, :new, :create, :edit, :update]
    get   'users/select', to: 'users#select', as: 'user_select'
    patch 'users/switch', to: 'users#switch', as: 'user_switch'
  devise_for :users,
    only: [:sessions],
    controllers: {
      sessions: 'users/sessions'
    }
  
  resources :year_terms, only: [:show]
end
