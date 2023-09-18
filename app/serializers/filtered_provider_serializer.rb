class FilteredProviderSerializer
  include JSONAPI::Serializer

  attributes :category,
              :provider_name,
              :address,
              :city,
              :state,
              :lat,
              :lon,
              :description
end
