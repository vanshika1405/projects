require 'rails_helper'

RSpec.describe FilesController, type: :controller do
  describe "GET #index" do
    it "returns a success response" do
      get :index
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      file = FileResource.create!(name: "Example", file_data: "Example data")
      get :show, params: { id: file.to_param }
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid parameters" do
      it "creates a new FileResource" do
        expect {
          post :create, params: { file: { name: "New File", file_data: "Example data" } }
        }.to change(FileResource, :count).by(1)
      end
    end
  end

 

end
