require_relative 'digital_ocean/droplet'
require_relative 'digital_ocean/configuration'

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
