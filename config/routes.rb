Rails.application.routes.draw do
  
  root to: 'tasks#index'
  resources :users, only: [:new, :create, :show]

  get   '/login'  => 'sessions#new', as: 'new_login'
  post  '/login'  => 'sessions#create'
  delete'/logout' => 'sessions#destroy'

  resources :tasks do
    resources :status, only: [:update]
  end
end
