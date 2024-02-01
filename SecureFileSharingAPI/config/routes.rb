Rails.application.routes.draw do
  root 'files#index'

  post '/users', to: 'users#create'
  post '/login', to: 'authentication#login' # New route for user login

  post '/files', to: 'files#create'
  get '/files/new', to: 'files#new', as: 'new_file'
  get '/files/:id', to: 'files#show', as: 'file'
  delete '/files/:id', to: 'files#destroy'
  get '/files', to: 'files#index'
end




