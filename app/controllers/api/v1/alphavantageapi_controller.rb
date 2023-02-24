class Api::V1::AlphavantageapiController < ApplicationController
  require 'rest-client'

  def index
    url = "https://www.alphavantage.co/query?function=TIME_SERIES_DAILY_ADJUSTED&symbol=#{params[:symbol]}.SA&apikey=PEQV59FJ89YWFKP5"
    response = RestClient.get(url)
    response = JSON.parse(response)
    render json: response['Time Series (Daily)']
  end
end

