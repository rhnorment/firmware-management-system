require 'carrierwave/test/matchers'
require 'rails_helper'

describe FirmwareImageUploader do
  include CarrierWave::Test::Matchers

  let(:firmware_build)  { double('fimware_build') }
  let(:uploader)        { FirmwareImageUploader.new(firmware_build, :firmware_image) }

  before do
    File.open("#{Rails.root}/spec/support/fixtures/profile1.jpg") { |f| uploader.store!(f) }
  end

  after do
    uploader.remove!
  end

  it 'has the correct format' do
    expect(uploader).to be_format('jpg')
  end

end
