class CreateAPIRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :api_requests do |t|
      t.string :server_name
      t.string :path_info
      t.string :remote_host
      t.string :http_accept_encoding
      t.string :http_user_agent
      t.string :server_protocol
      t.string :http_cache_control
      t.string :http_accept_language
      t.string :http_host
      t.string :remote_address
      t.string :http_keep_alive
      t.string :http_referrer
      t.string :http_cookie
      t.string :http_accept_charset
      t.string :request_uri
      t.string :gateway_interface
      t.string :query_string
      t.string :remote_user
      t.string :http_accept
      t.string :request_method
      t.string :http_connection

      t.timestamps
    end
  end
end
