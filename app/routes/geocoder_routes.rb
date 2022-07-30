# frozen_string_literal: true

# User Routes
#
class GeocoderRoutes < Application
  namespace '/v1' do
    post do
      geocoder_params = validate_with!(GeocoderParamsContract)

      result = GeocoderService.call(
        city: geocoder_params[:city]
      )

      if result.success?
        status 201
        json lat: result.coordinates.first, lon: result.coordinates.last
      else
        status 422
        error_response result.errors
      end
    end
  end
end
