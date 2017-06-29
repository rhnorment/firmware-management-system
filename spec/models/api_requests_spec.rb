# == Schema Information
#
# Table name: api_requests
#
#  id                   :integer          not null, primary key
#  server_name          :string
#  path_info            :string
#  remote_host          :string
#  http_accept_encoding :string
#  http_user_agent      :string
#  server_protocol      :string
#  http_cache_control   :string
#  http_accept_language :string
#  http_host            :string
#  remote_address       :string
#  http_keep_alive      :string
#  http_referrer        :string
#  http_cookie          :string
#  http_accept_charset  :string
#  request_uri          :string
#  gateway_interface    :string
#  query_string         :string
#  remote_user          :string
#  http_accept          :string
#  request_method       :string
#  http_connection      :string
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

require 'rails_helper'

RSpec.describe APIRequest, type: :model do
  describe 'ActiveRecord associations' do
    it { should have_db_column(:server_name).of_type(:string) }
    it { should have_db_column(:path_info).of_type(:string) }
    it { should have_db_column(:remote_host).of_type(:string) }
    it { should have_db_column(:http_accept_encoding).of_type(:string) }
    it { should have_db_column(:http_user_agent).of_type(:string) }
    it { should have_db_column(:server_protocol).of_type(:string) }
    it { should have_db_column(:http_cache_control).of_type(:string) }
    it { should have_db_column(:http_accept_language).of_type(:string) }
    it { should have_db_column(:http_host).of_type(:string) }
    it { should have_db_column(:remote_address).of_type(:string) }
    it { should have_db_column(:http_keep_alive).of_type(:string) }
    it { should have_db_column(:http_referrer).of_type(:string) }
    it { should have_db_column(:http_cookie).of_type(:string) }
    it { should have_db_column(:http_accept_charset).of_type(:string) }
    it { should have_db_column(:request_uri).of_type(:string) }
    it { should have_db_column(:gateway_interface).of_type(:string) }
    it { should have_db_column(:query_string).of_type(:string) }
    it { should have_db_column(:remote_user).of_type(:string) }
    it { should have_db_column(:http_accept).of_type(:string) }
    it { should have_db_column(:request_method).of_type(:string) }
    it { should have_db_column(:http_connection).of_type(:string) }
  end

  it 'should be valid with valid attributes' do
    expect(APIRequest.new(api_request)).to be_valid
  end
end
