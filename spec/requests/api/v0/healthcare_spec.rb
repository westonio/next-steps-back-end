require "rails_helper"

RSpec.describe "Healthcare", type: :request do
  describe "GET /api/v0/healthcare", :vcr do
    it "should return healthcare facilities near the user with 211 search API. It will return JSON that has 1. facility name, 2. phone number (if available) 3. short description of services, and 4. address details." do
      keyword = "healthcare"
      location = "denver"
      get "/api/v0/healthcare?keyword=#{keyword}&location=#{location}"
      response_data = JSON.parse(response.body, symbolize_names: true)
      providers = response_data[:data]

      expect(response).to be_successful
      providers.each do |provider|
        expect(proider).to have_key(:id)
        expect(proider[:id]).to be_an(String)

        expect(proider[:attributes]).to have_key(:provider_name)
        expect(proider[:attributes][:name]).to be_a(String)

        expect(proider[:attributes]).to have_key(:street)
        expect(proider[:attributes][:street]).to be_a(String)

        expect(proider[:attributes]).to have_key(:city)
        expect(proider[:attributes][:city]).to be_a(String)

        expect(proider[:attributes]).to have_key(:lat)
        expect(proider[:attributes][:lat]).to be_a(String)

        expect(proider[:attributes]).to have_key(:lon)
        expect(proider[:attributes][:lon]).to be_a(String)
      end
    end
  end
end