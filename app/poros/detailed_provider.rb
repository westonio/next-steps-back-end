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
    @phone = get_phone(data)
    @fees = data[:services].first[:fees]
    @schedule = data[:locations].first[:schedule]
  end

  def get_phone(data)
    if data[:services].first.has_key?(:phone)
      find_phone(data[:services].first[:phone])
    elsif data[:locations].first.has_key?(:phone)
      find_phone(data[:locations].first[:phone])
    else
      "Phone number not available"
    end
  end

  def find_phone(phone_numbers)
    phone = phone_numbers.first
    phone[:number]
  end
end