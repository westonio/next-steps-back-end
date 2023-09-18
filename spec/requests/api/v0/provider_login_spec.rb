require "rails_helper"

RSpec.describe "Provider API", type: :request do
  context "with valid parameters" do
    it "logs in a provider with valid credentials" do
      provider = Provider.create!(
        name: "Test Organization",
        description: "Test Description",
        street: "123 Test St",
        city: "Test City",
        state: "TX",
        zipcode: "12345",
        website: "https://www.test.com",
        phone: "123-456-7890",
        fees: "Test Fees",
        schedule: "Test Schedule",
        username: "test",
        password: "test"
      )

      post "/api/v0/provider_login", params: { username: "test", password: "test" }
      
      expect(response).to have_http_status(:ok)
      expect(response.body).to include(provider.name)
      expect(response.body).to include(provider.description)
      expect(response.body).to include(provider.street)
      expect(response.body).to include(provider.city)
      expect(response.body).to include(provider.state)
      expect(response.body).to include(provider.zipcode)
      expect(response.body).to include(provider.website)
      expect(response.body).to include(provider.phone)
      expect(response.body).to include(provider.fees)
      expect(response.body).to include(provider.schedule)
    end
  end

  context "with invalid parameters" do
    it "does not log in a provider with invalid credentials" do
      provider = Provider.create!(
        name: "Test Organization",
        description: "Test Description",
        street: "123 Test St",
        city: "Test City",
        state: "TX",
        zipcode: "12345",
        website: "https://www.test.com",
        phone: "123-456-7890",
        fees: "Test Fees",
        schedule: "Test Schedule",
        username: "test",
        password: "test"
      )

      post "/api/v0/provider_login", params: { username: "test", password: "wrong" }

      expect(response).to have_http_status(:unauthorized)
      expect(response.body).to include("Invalid credentials")
    end
  end
end
