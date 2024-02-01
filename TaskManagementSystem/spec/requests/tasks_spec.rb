require 'rails_helper'

RSpec.describe TasksController, type: :controller do
  let(:valid_attributes) {
    { title: 'New Task', description: 'Task Description', status: 'pending' }
  }

  let(:invalid_attributes) {
    { title: '', description: '', status: '' }
  }

  describe 'GET #index' do
    it 'returns a success response' do
      get :index, format: :json
      expect(response).to be_successful
      expect(response.content_type).to eq('application/json; charset=utf-8')
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      task = Task.create! valid_attributes
      get :show, params: { id: task.to_param }, format: :json
      expect(response).to be_successful
      expect(response.content_type).to eq('application/json; charset=utf-8')
    end
  end

  describe 'POST #create' do
    context 'with valid parameters' do
      it 'creates a new Task' do
        expect {
          post :create, params: { task: valid_attributes }, format: :json
        }.to change(Task, :count).by(1)
        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq('application/json; charset=utf-8')
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Task' do
        expect {
        post :create, params: { task: invalid_attributes }, format: :json
        }.to_not change(Task, :count)
        expect(response).to have_http_status(:unprocessable_entity)

      end
    end
    
    
  end

  describe 'PUT #update' do
    let(:new_attributes) {
      { title: 'Updated Task', description: 'Updated Description', status: 'completed' }
    }

    context 'with valid parameters' do
      it 'updates the requested task' do
        task = Task.create! valid_attributes
        put :update, params: { id: task.to_param, task: new_attributes }, format: :json
        task.reload
        expect(task.title).to eq('Updated Task')
        expect(task.description).to eq('Updated Description')
        expect(task.status).to eq('completed')
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq('application/json; charset=utf-8')
      end
    end

    context 'with invalid parameters' do
      it 'does not update the requested task' do
        task = Task.create! valid_attributes
        put :update, params: { id: task.to_param, task: invalid_attributes }, format: :json
        task.reload
    
        expect(task.title).to eq('New Task') # Ensure the task remains unchanged
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json; charset=utf-8')
      end
    end
    
    
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested task' do
      task = Task.create! valid_attributes
      expect {
        delete :destroy, params: { id: task.to_param }, format: :json
      }.to change(Task, :count).by(-1)
      expect(response).to have_http_status(:no_content)
      expect(response.content_type).to eq('application/json; charset=utf-8')
    end
  end
end


