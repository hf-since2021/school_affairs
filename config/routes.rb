Rails.application.routes.draw do
  # devise_for :users
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  # scope '/:year_term' do

  # end
end
