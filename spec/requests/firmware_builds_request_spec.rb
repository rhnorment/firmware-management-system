require 'rails_helper'

RSpec.describe 'FirmwareBuilds API', type: :request do

  let!(:build_1)    { FirmwareBuild.create(firmware_build_attributes) }
  let!(:build_2)    { FirmwareBuild.create(firmware_build_attributes(software_revision: 1.0)) }

  let(:build_id)    { FirmwareBuild.first.id }
  let(:latest_id)   { FirmwareBuild.latest.id }

  describe 'GET /firmware_builds' do
    before { get '/v1/firmware_builds' }

    it 'returns firmware_builds' do
      expect(json).not_to be_empty
      expect(json.size).to eq(2)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /firmware_builds/:id' do

    before { get '/v1/firmware_builds/' + build_id.to_s }

    context 'when the record exists' do
      it 'returns the firmware_build' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(build_id)
      end

      it 'returns the status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:build_id) { 100 }

      it 'returns the status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find FirmwareBuild/)
      end
    end
  end

  describe 'GET /firmware_builds/latest' do
    before { get '/v1/firmware_builds/latest' }

    it 'returns firmware_build' do
      expect(json).not_to be_empty
      expect(json['id']).to eq(latest_id)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

end