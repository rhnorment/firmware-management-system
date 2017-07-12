# == Schema Information
#
# Table name: api_requests
#
#  id                   :integer          not null, primary key
#  gateway_interface    :string           default("")
#  http_accept          :string           default("")
#  http_accept_charset  :string           default("")
#  http_accept_encoding :string           default("")
#  http_accept_language :string           default("")
#  http_cache_control   :string           default("")
#  http_connection      :string           default("")
#  http_cookie          :string           default("")
#  http_host            :string           default("")
#  http_keep_alive      :integer
#  http_referrer        :string           default("")
#  http_user_agent      :string           default("")
#  new                  :boolean          default(FALSE)
#  os_version           :string           default("")
#  path_info            :string           default("")
#  platform_type        :string           default("")
#  query_string         :string           default("")
#  remote_address       :string           default("")
#  remote_host          :string           default("")
#  remote_user          :string           default("")
#  request_method       :string           default("")
#  request_uri          :string           default("")
#  server_name          :string           default("")
#  server_protocol      :string           default("")
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

class APIRequest < ApplicationRecord

  scope :unique, -> { where(new: true) }

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
    request.http_user_agent = env['HTTP_USER_AGENT']
    request.new = request.is_unique?(env['REMOTE_ADDR'])
    request.os_version = request.os_version(env['HTTP_USER_AGENT'])
    request.path_info = env['PATH_INFO']
    request.platform_type = request.platform(env['HTTP_USER_AGENT'])
    request.query_string = env['QUERY_STRING']
    request.remote_address = env['REMOTE_ADDR']
    request.remote_host = env['REMOTE_HOST']
    request.remote_user = env['REMOTE_USER']
    request.request_method = env['REQUEST_METHOD']
    request.request_uri = env['REQUEST_URI']
    request.server_name = env['SERVER_NAME']
    request.server_protocol = env['SERVER_PROTOCOL']

    request.save
  end

  def is_unique?(remote_address)
    similar_addresses = APIRequest.pluck(:remote_address).uniq
    !similar_addresses.include?(remote_address)
  end

  def os_version(user_agent_string)
    AgentOrange::UserAgent.new(user_agent_string).device.operating_system.to_s if user_agent_string
  end

  def platform(user_agent_string)
    AgentOrange::UserAgent.new(user_agent_string).device.platform.version.major if user_agent_string
  end

end
