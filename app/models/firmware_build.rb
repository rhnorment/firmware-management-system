# == Schema Information
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

class FirmwareBuild < ApplicationRecord

  validates         :release_date,      presence: true
  validates         :hardware_revision, presence: true
  validates         :software_revision, presence: true
  validates         :image,             presence: true

end
