class AddImagesToFirmwareBuilds < ActiveRecord::Migration[5.0]
  def self.up
    change_table :firmware_builds do  |t|
      t.rename    :firmware_image, :image_a
      t.string    :image_b
    end
  end

  def self.down
    change_table :firmware_builds do  |t|
      t.rename    :image_a, :firmware_image
      t.remove    :image_b
    end
  end
end
