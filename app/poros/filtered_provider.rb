class FilteredProvider
  attr_reader :id, 
              :provider_name,
              :address,
              :city,
              :state,
              :lat,
              :lon,
              :description,
              :category
  
  def initialize(data, keyword)
    @id = data[:document][:idServiceAtLocation]
    @provider_name = data[:document][:nameService]
    @address = data[:document][:address1Physicaladdress]
    @city = data[:document][:cityPhysicaladdress]
    @state = data[:document][:statePhysicaladdress]
    @lat = data[:document][:latitudeLocation]
    @lon = data[:document][:longitudeLocation]
    @description = data[:document][:descriptionService]
    @category = keyword
  end
end
