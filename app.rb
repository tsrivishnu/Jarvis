require 'sinatra'
require 'pry'
require 'sinatra/config_file'
# require_relative 'lib/google_geocode'

set :bind, '0.0.0.0'
# config_file 'config.yml'

get "/" do
  content_type :json
  "Hi"
  # if params[:address].nil?
  #   halt 400, "Address is missing"
  # end
  # # If we are to ever change the provider, we can simply add a new class
  # # for that provider and change the line below.
  # GoogleGeocode.get_latlong(address: params[:address]).to_json
end
