class CreateAPIRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :api_requests do |t|
      t.string :gateway_interface, default: ''
      t.string :http_accept, default: ''
      t.string :http_accept_charset, default: ''
      t.string :http_accept_encoding, default: ''
      t.string :http_accept_language, default: ''
      t.string :http_cache_control, default: ''
      t.string :http_connection, default: ''
      t.string :http_cookie, default: ''
      t.string :http_host, default: ''
      t.integer :http_keep_alive
      t.string :http_referrer, default: ''
      t.string :http_user_agent, default: ''
      t.boolean :new, default: false
      t.index :new
      t.string :path_info, default: ''
      t.string :query_string, default: ''
      t.string :remote_address, default: ''
      t.index :remote_address
      t.string :remote_host, default: ''
      t.string :remote_user, default: ''
      t.string :request_method, default: ''
      t.string :request_uri, default: ''
      t.string :server_name, default: ''
      t.string :server_protocol, default: ''

      t.timestamps
    end
  end
end
