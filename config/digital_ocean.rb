DigitalOcean.configure do |config|
  config.access_token = AppConfig.digital_ocean["access_key"]
  config.ssh_key_name = AppConfig.digital_ocean["ssh_key_name"]
end
