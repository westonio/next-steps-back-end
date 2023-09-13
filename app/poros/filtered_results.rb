class FilteredResults
  attr_reader :provider_id, :provider_name, :street, :city, :lat, :lon, :description
  
  def initialize(data)
    @provider_id = data[:document][:idServiceAtLocation]
    @provider_name = data[:document][:nameService]
    @street = data[:document][:address1PhysicalAddress]
    @city = data[:document][:cityPhysicalAddress]
    @lat = data[:document][:latitudeLocation]
    @lon = data[:document][:longitudeLocation]
    @description = data[:document][:descriptionService]

  end
end