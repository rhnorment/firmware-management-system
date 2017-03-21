#== Schema Information
#
# Table name: firmware_builds
#
#  id                :integer          not null, primary key
#  release_date      :date
#  hardware_revision :integer
#  software_revision :integer
#  image             :binary
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#


ActiveAdmin.register FirmwareBuild do

  menu priority: 2

end
