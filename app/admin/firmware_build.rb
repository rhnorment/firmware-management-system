# == Schema Information
#
# Table name: firmware_builds
#
#  id                :integer          not null, primary key
#  release_date      :date
#  hardware_revision :integer
#  software_revision :integer
#  firmware_image    :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

ActiveAdmin.register FirmwareBuild do

  menu priority: 2

  permit_params :release_date,
                :hardware_revision,
                :software_revision,
                :firmware_image

  index do
    selectable_column
    column  :release_date
    column  :hardware_revision
    column  :software_revision
    column  :firmware_image

    actions
  end

  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs do
      f.input :release_date, order: [:month, :day, :year], start_year: Date.today.year
      f.input :hardware_revision
      f.input :software_revision
      f.input :firmware_image, as: :file, hint: firmware_build.firmware_image.url
      li link_to 'Remove Image', remove_image_admin_firmware_build_path(firmware_build),
          method: :put if firmware_build.firmware_image?
    end

    f.actions
  end

  member_action :remove_image, method: :put do
    resource.remove_firmware_image!
    resource.save
    redirect_to admin_firmware_build_path(resource)
  end

end
