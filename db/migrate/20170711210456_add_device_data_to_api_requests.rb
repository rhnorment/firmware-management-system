class AddDeviceDataToAPIRequests < ActiveRecord::Migration[5.0]
  def change
    add_column :api_requests, :platform_type, :string, default: ''
    add_column :api_requests, :os_version, :string, default: ''
  end
end
