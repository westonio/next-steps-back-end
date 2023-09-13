class Api::V0::HealthcareController < ApplicationController
  def index
    conn = Faraday.new(url: "https://api.211.org/search/v1/api/Search/Keyword?Keyword=#{params[:keyword]}&Location=#{params[:location]}&Distance=10") do |faraday|
      faraday.headers["Api-Key"] = Rails.application.credentials.my_api_key[:primary_key]
    end
    response = conn.get
    result_objects = JSON.parse(response.body, symbolize_names: true)[:results].map do |data|
      FilteredResults.new(data) 
    end
    render json: DataSerializer.new(result_objects)
  end
end