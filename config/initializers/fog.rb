if Rails.env.testing? #aquí se puede usar reducido
  CarrierWave.configure do |config|
      config.storage = :file
      config.enable_processing = false
  end

elsif Rails.env.development?

  CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws' # required
    config.fog_credentials = {
    provider: 'AWS', # required
    aws_access_key_id: ENV['AWS_KEY_PAYROLLPROJECT'], # required
    aws_secret_access_key: ENV['AWS_SECRET_PAYROLLPROJECT'], # required
    #region: 'eu-west-1', # optional, defaults to 'us-east-1'
    #host: 's3.example.com', # optional, defaults to nil
    #endpoint: 'https://s3.example.com:8080' # optional, defaults to nil
    }
    config.fog_directory = 'payrollproject' # required
    config.fog_public = false # optional, defaults to true
    config.fog_attributes = { cache_control: "public, max-age=#{365.day.to_i}" } # optional, defaults to {}
  end

  elsif Rails.env.production?

   CarrierWave.configure do |config|
   config.fog_provider = 'fog/aws' # required
     config.fog_credentials = {
     provider: 'AWS', # required
     aws_access_key_id: ENV['AWS_KEY_PAYROLLPROJECT'], # required
     aws_secret_access_key: ENV['AWS_SECRET_PAYROLLPROJECT'], # required
     #region: 'eu-west-1', # optional, defaults to 'us-east-1'
     #host: 's3.example.com', # optional, defaults to nil
     #endpoint: 'https://s3.example.com:8080' # optional, defaults to nil
     }
     config.fog_directory = 'payrollprojectprod' # required
     config.fog_public = false # optional, defaults to true
     config.fog_attributes = { cache_control: "public, max-age=#{365.day.to_i}" } # optional, defaults to {}
   end
end
