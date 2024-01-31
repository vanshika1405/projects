# spec/controllers/users_controller_spec.rb

require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'POST #register' do
    it 'registers a new user' do
      post :register, params: { user: { username: 'testuser', email: 'test@example.com', password: 'password' } }
      expect(response).to have_http_status(:success)
      expect(json['success']).to be true
      expect(json['message']).to eq('User registered successfully')
    end

    it 'fails to register with invalid parameters' do
      post :register, params: { user: { username: '', email: 'invalid_email', password: 'short' } }
      expect(response).to have_http_status(:unprocessable_entity)
      expect(json['success']).to be false
      expect(json['errors']).to include("Username can't be blank", "Email is invalid", "Password is too short")
    end
  end

  describe 'POST #login' do
    let!(:user) { create(:user, username: 'testuser', password: 'password') }

    it 'logs in an existing user' do
      post :login, params: { username: 'testuser', password: 'password' }
      expect(response).to have_http_status(:success)
      expect(json['success']).to be true
      expect(json['token']).to be_present
    end

    it 'fails to log in with incorrect password' do
      post :login, params: { username: 'testuser', password: 'wrong_password' }
      expect(response).to have_http_status(:unauthorized)
      expect(json['success']).to be false
      expect(json['errors']).to eq('Invalid username or password')
    end
  end

  describe 'POST #logout' do
    it 'logs out a user' do
      # Implement logout test based on your application logic
    end
  end
end

