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
                :image_a,
                :image_b

  index do
    selectable_column
    column  :release_date
    column  :hardware_revision
    column  :software_revision

    actions
  end

  form do |f|
    f.semantic_errors *f.object.errors.keys

    f.inputs do
      f.input :release_date, as: :datepicker
      f.input :hardware_revision
      f.input :software_revision
      f.input :image_a, as: :file, hint: firmware_build.image_a.url
      f.input :image_b, as: :file, hint: firmware_build.image_b.url
    end

    f.actions
  end

  show do
    attributes_table do
      row :release_date
      row :hardware_revision
      row :software_revision
      row('Image A') { |build| build.image_a.url }
      row('Image B') { |build| build.image_b.url }
    end

    active_admin_comments
  end

end
