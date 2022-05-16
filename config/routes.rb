Rails.application.routes.draw do
  root to: "year_terms#index"
  resources :year_terms, only: [:show]
  devise_for :users,
    controllers: {
      sessions: 'users/sessions'
    }

  # scope '/:year_term' do

  # end
end
