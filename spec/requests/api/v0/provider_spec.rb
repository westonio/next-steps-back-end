require "rails_helper"

RSpec.describe "Provider API", type: :request do
  describe "POST /api/v0/providers" do
    context "with valid parameters" do
      let(:valid_params) do
        {
          organization_name: "Test Organization",
          description: "Test Description",
          address: "123 Test St",
          city: "Test City",
          state: "TX",
          zip: "12345",
          web_url: "https://www.test.com",
          contact_phone: "123-456-7890",
          fees: "Test Fees",
          schedule: "Test Schedule"
        }
      end

      it "creates a provider" do
        expect do
          post "/api/v0/providers", params: { provider: valid_params }
        end.to change(Provider, :count).by(1)

        expect(response).to have_http_status(:created)
      end
    end

    context "with invalid parameters" do
      let(:invalid_params) do
        {
          organization_name: nil,
          description: nil,
          address: nil,
          city: nil,
          state: nil,
          zip: nil,
          web_url: nil,
          contact_phone: nil,
          fees: nil,
          schedule: nil
        }
      end

      it "does not create a provider" do
        expect do
          post "/api/v0/providers", params: { provider: invalid_params }
        end.to change(Provider, :count).by(0)

        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
