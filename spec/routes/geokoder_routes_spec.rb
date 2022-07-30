# frozen_string_literal: true

RSpec.describe GeocoderRoutes, type: :routes do # rubocop: disable Metrics/BlockLength
  describe 'POST /v1' do  # rubocop: disable Metrics/BlockLength
    let(:city_name) { 'Анадырь' }
    let(:lat) { 64.7313924 }
    let(:lon) { 177.5015421 }
    let(:params) { { city: city_name } }

    context 'valid parameters' do
      it 'returns an city' do
        post '/v1', params

        expect(last_response.status).to eq(201)
        expect(response_body).to a_hash_including(
                                   'lat' => lat, 'lon' => lon
        )
      end
    end

    context 'unknown city name' do
      let(:city_name) { 'unknown-city-name' }

      it 'returns an user' do
        post '/v1', params

        expect(last_response.status).to eq(422)
        expect(response_body['errors']).to include(
          {
            'detail' => 'Запрашиваемый ресурс не найден'
          }
        )
      end
    end
  end
end
