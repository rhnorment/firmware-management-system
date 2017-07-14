class AddLocationFieldsToAPIRequests < ActiveRecord::Migration[5.0]
  def change
    add_column :api_requests, :city, :string, default: ''
    add_column :api_requests, :country, :string, default: ''
    add_column :api_requests, :latitude, :decimal, precision: 15, scale: 13, default: nil
    add_column :api_requests, :longitude, :decimal, precision: 15, scale: 13, default: nil
    add_column :api_requests, :region, :string, default: ''
  end
end
