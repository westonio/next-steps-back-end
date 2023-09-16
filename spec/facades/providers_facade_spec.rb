require 'rails_helper'

RSpec.describe ProvidersFacade, :vcr do
  describe "#provider_details" do
    it "returns a provider object for a specific service location" do
      provider_id = "211contrac-1561"
      facade = ProvidersFacade.new(provider_id)
      provider = facade.provider_details

      expect(provider).to be_a(DetailedProvider)
    end
  end
end