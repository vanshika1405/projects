require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'POST #create' do
    it 'creates a new user' do
      post :create, params: { user: { username: 'testuser', email: 'test@example.com', password: 'password' } }
      expect(response).to have_http_status(:created)
    end
  end


end

