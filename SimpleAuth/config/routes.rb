

Rails.application.routes.draw do
 
  post '/register', to: 'users#register'
  

  
  post '/login', to: 'users#login'

  # User logout
  post '/logout', to: 'users#logout'

  # Show all users 
  get '/users', to: 'users#index'

  # Show a specific user 
  get '/users/:id', to: 'users#show', as: 'user'

  # Update user information
  patch '/users/:id', to: 'users#update'

  # Delete user
  delete '/users/:id', to: 'users#destroy'
end


