Rails.application.routes.draw do
  
  get   '/tasks',               to: 'tasks#index'
  get   '/tasks/new' ,          to: 'tasks#new'
  post  '/tasks',               to: 'tasks#create'
  get   '/tasks/:id',           to: 'tasks#show', as: 'task'
  get   '/tasks/:id/edit',      to: 'tasks#edit', as: 'edit_task' 
  patch '/tasks/:id',           to: 'tasks#update'
  delete'/tasks/:id',           to: 'tasks#destroy'
  post '/tasks/update_state',   to: 'tasks#update_state', as: 'update_state'
  root to: 'tasks#index'
  resources :users, only: [:new, :create, :show]

  get   '/login'  => 'sessions#new', as: 'new_login'
  post  '/login'  => 'sessions#create'
  delete'/logout' => 'sessions#destroy'
end
