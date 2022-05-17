Rails.application.routes.draw do
  root to: "year_terms#index"
  resources :year_terms, only: [:show]
  devise_for :users,
    only: [:sessions],
    controllers: {
      sessions: 'users/sessions'
    }
  resources :users, only: [:index]
    get   'users/select', to: 'users#select', as: 'user_select'
    patch 'users/switch', to: 'users#switch', as: 'user_switch'
end
