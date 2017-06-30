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
    it { should have_db_column(:path_info).of_type(:string) }
    it { should have_db_column(:query_string).of_type(:string) }
    it { should have_db_column(:remote_address).of_type(:string) }
    it { should have_db_column(:remote_host).of_type(:string) }
    it { should have_db_column(:remote_user).of_type(:string) }
    it { should have_db_column(:request_method).of_type(:string) }
    it { should have_db_column(:request_uri).of_type(:string) }
    it { should have_db_column(:server_name).of_type(:string) }
    it { should have_db_column(:server_protocol).of_type(:string) }

    it { should have_db_index(:new) }
    it { should have_db_index(:remote_address) }

  end

  it 'should be valid with valid attributes' do
    expect(APIRequest.new(api_request)).to be_valid
  end
end