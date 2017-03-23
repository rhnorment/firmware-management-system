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

class FirmwareBuild < ApplicationRecord

  validates         :release_date,      presence: true
  validates         :hardware_revision, presence: true
  validates         :software_revision, presence: true
  validates         :firmware_image,    presence: true
  validates         :firmware_image_file_name, uniqueness: { case_sensitive: false }

  validate          :release_date_not_in_past

  private

  def release_date_not_in_past
    errors.add(:release_date, 'cannot be in past') if release_date.present? && release_date < Date.today
  end

end
