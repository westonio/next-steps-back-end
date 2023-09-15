require 'rails_helper'
RSpec.describe TwoOneOneService, :vcr do
  describe "#search(keyword, location)" do
    it "returns the top ten results for a given keyword and location" do
      keyword = "healthcare"
      location = "denver+CO"
      service = TwoOneOneService.new
      json = service.search(keyword, location)

      expect(json[:results].count).to eq(10)
      
      provider = json[:results].first[:document]
      
      expect(provider).to have_key(:id)
      expect(provider[:id]).to be_an(String)

      expect(provider).to have_key(:nameService)
      expect(provider[:nameService]).to be_a(String)

      expect(provider).to have_key(:address1PhysicalAddress)
      expect(provider[:address1PhysicalAddress]).to be_a(String)

      expect(provider).to have_key(:cityPhysicalAddress)
      expect(provider[:cityPhysicalAddress]).to be_a(String)

      expect(provider).to have_key(:statePhysicalAddress)
      expect(provider[:statePhysicalAddress]).to be_a(String)

      expect(provider).to have_key(:latitudeLocation)
      expect(provider[:latitudeLocation]).to be_a(String)

      expect(provider).to have_key(:longitudeLocation)
      expect(provider[:longitudeLocation]).to be_a(String)

      expect(provider).to have_key(:descriptionService)
      expect(provider[:descriptionService]).to be_a(String)
    end
  end
end 
