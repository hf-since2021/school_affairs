Rails.application.routes.draw do
  root to: "year_terms#index"
  resources :year_terms, only: [:show]
  devise_for :users,
    only: [:sessions],
    controllers: {
      sessions: 'users/sessions'
    }
  resources :user, only: [:new]
  get   'select', to: 'users#select', as: 'user_select'
  patch 'switch', to: 'users#switch', as: 'user_switch'
end
