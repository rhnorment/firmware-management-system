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

class FirmwareBuild < ApplicationRecord

  mount_uploader    :firmware_image,    FirmwareImageUploader

  validates         :release_date,      presence: true
  validates         :hardware_revision, presence: true
  validates         :software_revision, presence: true
  validates         :firmware_image,    presence: true

  validate          :release_date_not_in_past

  def release_date_not_in_past
    errors.add(:release_date, 'cannot be in past') if release_date.present? && release_date < Date.today
  end

end
