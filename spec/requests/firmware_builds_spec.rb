require 'rails_helper'

RSpec.describe 'FirmwareBuilds API', type: :request do

  let!(:firmware_build_1) { FirmwareBuild.create(firmware_build_attributes) }
  let!(:firmware_build_2) { FirmwareBuild.create(
      firmware_build_attributes(firmware_image: File.new("#{Rails.root}/spec/support/fixtures/profile2.bin"))) }

  let(:firmware_build_id)       { FirmwareBuild.first.id }

  describe 'GET /firmware_builds' do
    before { get '/firmware_builds' }

    it 'returns firmware_builds' do
      expect(json).not_to be_empty
      expect(json.size).to eq(2)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /firmware_builds/:id' do

    before { get "/firmware_builds/#{firmware_build_id}" }

    context 'when the record exists' do
      it 'returns the firmware_build' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(firmware_build_id)
      end

      it 'returns the status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:firmware_build_id) { 100 }

      it 'returns the status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find FirmwareBuild/)
      end
    end
  end

end