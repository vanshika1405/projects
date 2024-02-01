require 'rails_helper'

RSpec.describe FilesController, type: :controller do
  let(:user) { create(:user) } 

  describe 'POST #create' do
    it 'creates a new file' do
      
      file_data = fixture_file_upload('files/your_file.pdf', 'application/pdf')

      
      request.headers['Authorization'] = "Bearer #{JsonWebToken.encode(user_id: user.id)}"

      post :create, params: { file: { name: 'Your File Name', file_data: file_data } }

      expect(response).to have_http_status(:created)
    end
  end

  
end

