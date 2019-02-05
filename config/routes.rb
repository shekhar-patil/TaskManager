Rails.application.routes.draw do
  
  get  '/tasks',        to: 'tasks#index'
  get  '/new' ,  	    to: 'tasks#new'
  post '/tasks',		to: 'tasks#create'
  get  '/tasks/:id',	to: 'tasks#show', as: 'task'
end
