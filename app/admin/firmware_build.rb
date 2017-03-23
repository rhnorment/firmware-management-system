
# == Schema Information
#
# Table name: firmware_builds
#
#  id                       :integer          not null, primary key
#  release_date             :date
#  hardware_revision        :integer
#  software_revision        :integer
#  firmware_image_file_name :string
#  firmware_image           :binary(10485760)
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#

ActiveAdmin.register FirmwareBuild do

  menu priority: 2

  permit_params :release_date,
                :hardware_revision,
                :software_revision,
                :firmware_image_file_name,
                :firmware_image

  index do
    column  :release_date
    column  :hardware_revision
    column  :software_revision
    column  :firmware_image_file_name

    actions
  end

  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs do
      f.input :release_date, order: [:month, :day, :year]
      f.input :hardware_revision
      f.input :software_revision
      f.input :firmware_image, as: :file
    end

    f.actions
  end

end
