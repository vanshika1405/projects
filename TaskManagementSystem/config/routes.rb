Rails.application.routes.draw do
  # Tasks routes
  get '/tasks', to: 'tasks#index', as: 'tasks'
  post '/tasks', to: 'tasks#create'
  get '/tasks/:id', to: 'tasks#show', as: 'task'
  patch '/tasks/:id', to: 'tasks#update'
  delete '/tasks/:id', to: 'tasks#destroy'
end


