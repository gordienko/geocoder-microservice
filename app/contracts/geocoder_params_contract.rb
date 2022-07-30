# frozen_string_literal: true

# Geocoder Params Contract
#
class GeocoderParamsContract < Dry::Validation::Contract
  params do
    required(:city).value(:string)
  end
end
