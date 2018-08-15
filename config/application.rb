require 'rubygems'
require 'bundler/setup'
Bundler.require(:default) # This will require all the gems
require "yaml"

require_relative '../lib/dialogue_flow'
require_relative '../lib/digital_ocean'

class AppConfig
  def self.load!
    @@configuration = YAML::load_file(File.join(__dir__, 'application.yml'))
  end

  def self.method_missing(method)
    @@configuration ||= {}
    return @@configuration[method.to_s]
  end
end

AppConfig.load!

require_all "config" # requires all files from the directory.
require "sinatra/config_file"

