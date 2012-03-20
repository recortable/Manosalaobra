# Configure carrierwave with the amazon S3 account

local = {}
if Rails.env == 'staging'
  local['access_key_id'] = ENV['S3_KEY']
  local['secret_access_key'] = ENV['S3_SECRET']
  local['bucket'] = ENV['S3_BUCKET']
else
  config_file = "#{Rails.root}/config/amazon_s3.yml"
  local = YAML::load(ERB.new(File.read(config_file)).result)[Rails.env]
end


CarrierWave.configure do |config|
  config.s3_access_key_id = local['access_key_id']
  config.s3_secret_access_key = local['secret_access_key']
  config.s3_bucket = local['bucket']
end
