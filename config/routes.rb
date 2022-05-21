Rails.application.routes.draw do
  root to: "informations#index"

  # グループウェア系
  resources :projects, only: [:index]

  # ユーザー管理系
  resources :users, only: [:index, :new, :create, :edit, :update]
    get  'users/select', to: 'users#select', as: 'user_select'
    post 'users/switch', to: 'users#switch', as: 'user_switch'
  devise_for :users,
    only: [:sessions],
    controllers: {
      sessions: 'users/sessions'
    }
  
  # マスタメンテ系
  resources :year_terms, only: [:show]
  resources :subject_areas, only: [:index, :new, :create]
  resources :subjects, only: [:index, :new]
end
