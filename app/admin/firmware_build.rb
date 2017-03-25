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

  config.sort_order = 'release_date_desc'

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
      f.input :release_date, as: :datepicker
      f.input :hardware_revision
      f.input :software_revision
      f.input :firmware_image, as: :file, hint: firmware_build.firmware_image.url
    end

    f.actions
  end

end
