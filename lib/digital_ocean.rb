require_relative 'digital_ocean/droplet'
require_relative 'digital_ocean/configuration'

# require all droplets
Dir[File.join(__dir__, 'digital_ocean/droplets', '**/*.rb')].each { |file|
  require file
}
module DigitalOcean
  class << self
    attr_writer :configuration
  end

  def self.configuration
    @_configuration ||= DigitalOcean::Configuration.new
  end

  def self.configure
    yield(configuration)
  end
end
