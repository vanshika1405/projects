require 'rails_helper'

RSpec.describe WeatherController, type: :controller do
  describe 'GET #show' do
    it 'returns a successful response' do  #testing using rspec
      get :show, params: { city: 'Indore' }
      expect(response).to be_successful
    end

    it 'returns JSON with weather data' do
      get :show, params: { city: 'Indore' }
      json_response = JSON.parse(response.body)
      expect(json_response).to have_key('main')
      expect(json_response['main']).to have_key('temp')
    end

   
  end
end
