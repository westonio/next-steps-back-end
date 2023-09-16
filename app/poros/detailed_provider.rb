class DetailedProvider
  attr_reader :id, 
              :name,
              :description,
              :street,
              :street2,
              :city,
              :state,
              :zipcode,
              :lat,
              :lon,
              :website,
              :phone,
              :fees,
              :schedule

  
  def initialize(data)
    @id = data[:idOrganization]
    @name = data[:name]
    @description = data[:description]
    @street = data[:locations].first[:address].first[:address_1]
    @street2 = data[:locations].first[:address].first[:address_2]
    @city = data[:locations].first[:address].first[:city]
    @state = data[:locations].first[:address].first[:state_province]
    @zipcode = data[:locations].first[:address].first[:zipcode]
    @lat = data[:locations].first[:latitude]
    @lon = data[:locations].first[:longitude]
    @website = data[:url]
    @phone = find_phone(data[:locations].first)
    @fees = data[:services].first[:fees]
    @schedule = data[:locations].first[:schedule]
  end

  def find_phone(data)
    phone = data[:phone].select do |phone|
      phone[:number] if phone[:type] == "Main Number"
    end.first
    phone[:number]
  end
end