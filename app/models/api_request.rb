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

class APIRequest < ApplicationRecord
end
