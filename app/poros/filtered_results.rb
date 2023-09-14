class FilteredResults
  attr_reader :id, 
              :provider_name,
              :street,
              :city,
              :state,
              :lat,
              :lon,
              :description
  
  def initialize(data)
    @id = data[:document][:idServiceAtLocation]
    @provider_name = data[:document][:nameService]
    @street = data[:document][:address1PhysicalAddress]
    @city = data[:document][:cityPhysicalAddress]
    @state = data[:document][:statePhysicalAddress] #! THIS IS AN ABBR 
    @lat = data[:document][:latitudeLocation]
    @lon = data[:document][:longitudeLocation]
    @description = data[:document][:descriptionService]
  end
end