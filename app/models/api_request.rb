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

  def self.record_api_request(env)
    request = APIRequest.new

    request.gateway_interface = env['GATEWAY_INTERFACE']
    request.http_accept = env['HTTP_ACCEPT']
    request.http_accept_charset = env['HTTP_ACCEPT_CHARSET']
    request.http_accept_encoding = env['HTTP_ACCEPT_ENCODING']
    request.http_accept_language = env['HTTP_ACCEPT_LANGUAGE']
    request.http_cache_control = env['HTTP_CACHE_CONTROL']
    request.http_connection = env['HTTP_CONNECTION']
    request.http_cookie = env['HTTP_COOKIE']
    request.http_host = env['HTTP_HOST']
    request.http_keep_alive = env['HTTP_KEEP_ALIVE']
    request.http_referrer = env['HTTP_REFERRER']
    request.http_user_agent = env['HTTP_USER-AGENT']
    request.new = request.is_unique?(env['REMOTE_ADDRESS'])
    request.path_info = env['PATH_INFO']
    request.query_string = env['QUERY_STRING']
    request.remote_address = env['REMOTE_ADDRESS']
    request.remote_host = env['REMOTE_HOST']
    request.remote_user = env['REMOTE_USER']
    request.request_method = env['REQUEST_METHOD']
    request.request_uri = env['REQUEST_URI']
    request.server_name = env['SERVER_NAME']
    request.server_protocol = env['SERVER_PROTOCOL']

    request.save
  end

  def is_unique?(remote_address)
    similar_addresses = APIRequest.where(remote_address: remote_address).pluck(:remote_address).uniq
    !similar_addresses.include?(remote_address)
  end

end
