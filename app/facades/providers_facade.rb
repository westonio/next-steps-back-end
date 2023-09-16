class ProvidersFacade
  def initialize(id)
    @id = id
  end

  def provider_details
    service = TwoOneOneService.new
    json = service.get_provider_details(@id)
    DetailedProvider.new(json.first)
  end
end