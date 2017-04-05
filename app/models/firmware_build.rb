# == Schema Information
#
# Table name: firmware_builds
#
#  id                :integer          not null, primary key
#  release_date      :date
#  hardware_revision :integer
#  software_revision :integer
#  image_a           :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  image_b           :string
#

class FirmwareBuild < ApplicationRecord

  mount_uploader    :image_a,           FirmwareImageUploader
  mount_uploader    :image_b,           FirmwareImageUploader

  validates         :release_date,      presence: true
  validates         :hardware_revision, presence: true
  validates         :image_a,           presence: true
  validates         :image_b,           presence: true
  validates         :software_revision, uniqueness: { scope: :hardware_revision, case_sensitive: false }

  after_destroy     :expire_firmware_build_latest_cache
  after_save        :expire_firmware_build_latest_cache

  def self.latest
    order(software_revision: :desc).first
  end

  def self.latest_cached
    Rails.cache.fetch('FirmwareBuild.latest') { order(software_revision: :desc).first }
  end

  def expire_firmware_build_latest_cache
    Rails.cache.delete('FirmwareBuild.latest')
  end

end
