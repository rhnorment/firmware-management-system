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

ActiveAdmin.register APIRequest do
  actions :index, :show

  config.sort_order = 'created_at_desc'

  menu priority: 3

  scope :all, default: true
  scope :unique

  filter :platform_type
  filter :remote_address

  index do
    selectable_column
    id_column

    column  :platform_type
    column  :remote_address
    column  :http_user_agent
    column('Unique?') { |request| status_tag(request.new) }
  end
  
  show do
    attributes_table do
      row('Unique?') { |request| status_tag(request.new) }
      row   :remote_address
      row   :server_name
      row   :http_user_agent
      row   :remote_host
      row   :request_method
      row   :request_uri
    end
  end

  sidebar 'User Agent Attributes', only: :show do
    attributes_table do
      row   :platform_type
      row   :os_version
    end
  end
end
