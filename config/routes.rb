Rails.application.routes.draw do
  root to: "informations#index"

  # グループウェア系
  resources :projects, only: [:index]

  # 生徒管理
  # resources :students, only: [:index, :new, :create]
  resources :annual_students, only: [:index, :new, :create]


  # ユーザー管理系
  resources :users, only: [:index, :new, :create, :edit, :update]
    get  'users/select', to: 'users#select', as: 'user_select'
    post 'users/switch', to: 'users#switch', as: 'user_switch'
  devise_for :users,
    only: [:sessions],
    controllers: {
      sessions: 'users/sessions'
    }
  resources :teachers,          only: [:index, :new, :create] do
    resources :annual_teachers,   only: [:new, :create]
    get   '/annual_teachers/edit',   to: 'annual_teachers#edit',   as: 'edit_annual_teacher'
    patch '/annual_teachers/update', to: 'annual_teachers#update', as: 'annual_teacher'
  end
  resources :annual_teachers,   only: [:index]

  # マスタメンテ系
  # scope :admin do
    resources :years,             only: [:index, :new, :create]
    resources :terms,             only: [:index, :new, :create]
    resources :year_terms,        only: [:index, :new, :create]
    resources :subject_areas,     only: [:index, :new, :create]
    resources :subjects,          only: [:index, :new, :create]
    # resources :subject_areas, only: [:index, :new, :create] do
    #   resources :subjects, param: :id, only: [:index]
    # end
    resources :jobs,              only: [:index, :new, :create]
    resources :sections,          only: [:index, :new, :create]
    resources :responsibilities,  only: [:index, :new, :create]
  # end

  # 欠席連絡・出欠席管理
  resources :contacts, only: [:index]
end
