# frozen_string_literal: true

require 'pry'

RSpec.describe GeocoderService do # rubocop: disable Metrics/BlockLength
  subject { described_class }

  let(:params) do
    {
      city: city_name,
    }
  end
  let(:city_name) { 'Анадырь' }

  context 'valid parameters' do
    it 'find city coordinates' do
      result = subject.call(params)

      expect(result.coordinates).to eq([64.7313924, 177.5015421])
    end
  end

  context 'invalid parameters' do
    let(:city_name) { '' }

    it 'city not found error' do
      result = subject.call(params)

      expect(result.errors).to include('Запрашиваемый ресурс не найден')
    end
  end
end
