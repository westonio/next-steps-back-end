class DataSerializer
  include JSONAPI::Serializer
  attributes :provider_name,
              :street,
              :city,
              :state,
              :lat,
              :lon,
              :description
end