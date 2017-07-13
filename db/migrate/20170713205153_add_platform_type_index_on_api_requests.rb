class AddPlatformTypeIndexOnAPIRequests < ActiveRecord::Migration[5.0]
  def change
    add_index :api_requests, :platform_type
  end
end
