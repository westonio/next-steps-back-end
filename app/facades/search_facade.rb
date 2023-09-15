class SearchFacade
  
  def search(keyword, location)
    
    service = TwoOneOneService.new
    
    json = service.search(keyword, location)
      json[:results].map do |provider_data|
        FilteredProvider.new(provider_data, keyword)
    end
  end
end
