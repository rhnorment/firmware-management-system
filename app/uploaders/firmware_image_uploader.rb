class FirmwareImageUploader < CarrierWave::Uploader::Base

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_whitelist
    %w(bin)
  end

end
