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

  mount_uploader    :image_a,           FirmwareImageUploader
  mount_uploader    :image_b,           FirmwareImageUploader

  validates         :release_date,      presence: true
  validates         :hardware_revision, presence: true
  validates         :image_a,           presence: true
  validates         :image_b,           presence: true
  validates         :software_revision, uniqueness: { scope: :hardware_revision, case_sensitive: false }


  validate          :release_date_not_in_past

  after_destroy     :expire_firmware_build_all_cache
  after_save        :expire_firmware_build_all_cache

  def self.all_cached
    Rails.cache.fetch('FirmwareBuild.all') { all }
  end

  def expire_firmware_build_all_cache
    Rails.cache.delete('FirmwareBuild.all')
  end

  def self.latest
    order(software_revision: :desc).first
  end

  def release_date_not_in_past
    errors.add(:release_date, 'cannot be in past') if release_date.present? && release_date < Date.today
  end

end
