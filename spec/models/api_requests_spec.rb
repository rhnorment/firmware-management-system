# == Schema Information
#
# Table name: api_requests
#
#  id                   :integer          not null, primary key
#  gateway_interface    :string
#  http_accept          :string
#  http_accept_charset  :string
#  http_accept_encoding :string
#  http_accept_language :string
#  http_cache_control   :string
#  http_connection      :string
#  http_cookie          :string
#  http_host            :string
#  http_keep_alive      :integer
#  http_referrer        :string
#  http_user_agent      :string
#  new                  :boolean
#  path_info            :string
#  query_string         :string
#  remote_address       :string
#  remote_host          :string
#  remote_user          :string
#  request_method       :string
#  request_uri          :string
#  server_name          :string
#  server_protocol      :string
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

require 'rails_helper'

RSpec.describe APIRequest, type: :model do
  let(:resource_class)  { 'APIRequest' }
  let(:all_resources)   { ActiveAdmin.application.namespaces[:admin].resources }
  let(:resource)        { all_resources[resource_class] }

  it 'has a valid resource name' do
    expect(resource.resource_name).to eq('APIRequest')
  end

  it 'should display in the menu bar' do
    expect(resource).to be_include_in_menu
  end

  it 'has the default set of CRUD actions available to it' do
    expect(resource.defined_actions).to include(:index, :show)
  end

  describe 'ActiveRecord associations' do
    it { should have_db_column(:gateway_interface).of_type(:string) }
    it { should have_db_column(:http_accept).of_type(:string) }
    it { should have_db_column(:http_accept_charset).of_type(:string) }
    it { should have_db_column(:http_accept_encoding).of_type(:string) }
    it { should have_db_column(:http_accept_language).of_type(:string) }
    it { should have_db_column(:http_cache_control).of_type(:string) }
    it { should have_db_column(:http_connection).of_type(:string) }
    it { should have_db_column(:http_cookie).of_type(:string) }
    it { should have_db_column(:http_host).of_type(:string) }
    it { should have_db_column(:http_keep_alive).of_type(:integer) }
    it { should have_db_column(:http_referrer).of_type(:string) }
    it { should have_db_column(:http_user_agent).of_type(:string) }
    it { should have_db_column(:new).of_type(:boolean) }
    it { should have_db_column(:os_version).of_type(:string) }
    it { should have_db_column(:path_info).of_type(:string) }
    it { should have_db_column(:platform_type).of_type(:string) }
    it { should have_db_column(:query_string).of_type(:string) }
    it { should have_db_column(:remote_address).of_type(:string) }
    it { should have_db_column(:remote_host).of_type(:string) }
    it { should have_db_column(:remote_user).of_type(:string) }
    it { should have_db_column(:request_method).of_type(:string) }
    it { should have_db_column(:request_uri).of_type(:string) }
    it { should have_db_column(:server_name).of_type(:string) }
    it { should have_db_column(:server_protocol).of_type(:string) }

    it { should have_db_index(:new) }
    it { should have_db_index(:platform_type) }
    it { should have_db_index(:remote_address) }
  end

  it 'should be valid with valid attributes' do
    expect(APIRequest.new(api_request)).to be_valid
  end

  describe 'class methods' do
    describe '.record_api_request' do
      it 'should save the record and increment the counter' do
        APIRequest.create(api_request)
        expect(APIRequest.count).to eql(1)
      end
    end

    describe '.is_unique?' do
      it 'should set request.new te TRUE if it is coming from a unique IP address' do
        APIRequest.create(api_request)
        request2 = APIRequest.new(api_request(remote_address: '127.0.0.2'))

        expect(request2.is_unique?('127.0.0.2')).to be_truthy
      end

      it 'should set request.new to FALSE if it is coming from a non-unique IP address' do
        APIRequest.create(api_request)
        request2 = APIRequest.create(api_request)

        expect(request2.is_unique?('127.0.0.1')).to be_falsey
      end
    end

    describe '.set_os_version' do
      it 'should set the os version by parsing the user agent string' do
        string = 'Mozilla/5.0 (iPhone; CPU iPhone OS 6_1_1 like Mac OS X) AppleWebKit/536.26 (KHTML, like Gecko) Version/6.0 Mobile/10B145 Safari/8536.25'
        request = APIRequest.new(api_request(http_user_agent: string))

        expect(request.set_os_version(string)).to eql('Apple iOS 6.1.1')
      end
    end

    describe '.set_platform' do
      it 'should set the platform by parsing the user agent string' do
        string = 'Mozilla/5.0 (iPhone; CPU iPhone OS 6_1_1 like Mac OS X) AppleWebKit/536.26 (KHTML, like Gecko) Version/6.0 Mobile/10B145 Safari/8536.25'
        request = APIRequest.new(api_request(http_user_agent: string))

        expect(request.set_platform(string)).to eql('iPhone')
      end
    end
  end
end
