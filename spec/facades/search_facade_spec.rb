require 'rails_helper'
RSpec.describe SearchFacade, :vcr do
  describe "#search(keyword, location)" do
    it "returns the top ten results for a given keyword and location" do
      keyword = "healthcare"
      location = "denver+CO"
      facade = SearchFacade.new
      providers = facade.search(keyword, location)

      expect(providers).to be_an(Array)
      expect(providers.count).to eq(10)
      
      providers.each do |provider|
        expect(provider).to be_a(FilteredProvider)
      end
    end
  end
end
      
