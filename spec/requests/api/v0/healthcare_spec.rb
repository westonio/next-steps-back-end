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
        expect(provider).to have_key(:id)
        expect(provider[:id]).to be_an(String)

        expect(provider[:attributes]).to have_key(:provider_name)
        expect(provider[:attributes][:provider_name]).to be_a(String)

        expect(provider[:attributes]).to have_key(:provider_id)
        expect(provider[:attributes][:provider_id]).to be_a(String)

        expect(provider[:attributes]).to have_key(:description)
        expect(provider[:attributes][:description]).to be_a(String)

        expect(provider[:attributes]).to have_key(:street)
        expect(provider[:attributes][:street]).to be_a(String)

        expect(provider[:attributes]).to have_key(:city)
        expect(provider[:attributes][:city]).to be_a(String)

        expect(provider[:attributes]).to have_key(:lat)
        expect(provider[:attributes][:lat]).to be_a(String)

        expect(provider[:attributes]).to have_key(:lon)
        expect(provider[:attributes][:lon]).to be_a(String)
      end
    end
  end
end