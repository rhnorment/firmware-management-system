CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'

  config.fog_credentials = {
    provider:               'AWS',
    aws_access_key_id:      ENV['S3_KEY'],
    aws_secret_access_key:  ENV['S3_SECRET'],
    host:                   's3.amazonaws.com'
  }

  if Rails.env.development? || Rails.env.test?
    config.storage = :file
    config.enable_processing = false
    config.root = "#{Rails.root}/tmp"
  else
    config.storage = :fog
  end

  config.permissions =            0777
  config.directory_permissions =  0777
  config.cache_dir =              "#{Rails.root}/tmp/uploads"
  config.fog_directory =          ENV['S3_BUCKET_NAME']
  config.fog_attributes =         { 'Cache-Control' => "max-age=#{365.day.to_i}" }
end