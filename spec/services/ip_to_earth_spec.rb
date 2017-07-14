require 'rails_helper'

RSpec.describe IPToEarth do
  before do
    ip_address = '68.10.149.45'
    @result = IPToEarth.get_location_data(ip_address)
  end

  it 'should return a JSON object' do
    expect(@result['valid']).to be_truthy
  end

  it 'should return UNITED STATES as the country' do
    expect(@result['country']).to eql('United States')
  end

  it 'should return VIRGINIA BEACH as the city' do
    expect(@result['city']).to eql('Chesapeake')
  end

  it 'should return a latitude of 36.81903839111328' do
    expect(@result['latitude']).to eql(36.81903839111328)
  end

  it 'should return a longitude of -76.27494049072266' do
    expect(@result['longitude']).to eql(-76.27494049072266)
  end
end
