Rails.application.routes.draw do
  
  get '/index', to: 'tasks#index'
  get '/new' ,  to: 'tasks#new'
  
end
