class DataSerializer
  include JSONAPI::Serializer
  attributes :provider_id,
              :provider_name,
              :address,
              :city,
              :lat,
              :lon
end