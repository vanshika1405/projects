class WeatherController < ApplicationController
  require 'httparty'

  def show
    city = params[:city]
    api_key = '1602fbffe17f1b051c4919d4851b8f51'

    # Construct the URL with dynamic values
    url = "https://api.openweathermap.org/data/2.5/weather?q=#{city}&appid=#{api_key}"

    response = HTTParty.get(url)
    weather_data = JSON.parse(response.body)

    render json: weather_data
  end
end

  