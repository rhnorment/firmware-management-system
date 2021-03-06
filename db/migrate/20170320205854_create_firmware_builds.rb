class CreateFirmwareBuilds < ActiveRecord::Migration[5.0]
  def change
    create_table :firmware_builds do |t|
      t.date :release_date
      t.integer :hardware_revision
      t.integer :software_revision
      t.string  :firmware_image

      t.timestamps
    end
  end
end
