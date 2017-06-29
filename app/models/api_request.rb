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

class APIRequest < ApplicationRecord
end
