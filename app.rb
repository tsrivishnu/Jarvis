require 'sinatra'
require 'pry'
require 'sinatra/config_file'
require "sinatra/reloader" if development?
require_relative 'lib/dialogue_flow'


# require_relative 'lib/google_geocode'

set :bind, '0.0.0.0'
# config_file 'config.yml'

get "/" do
  content_type :json
  "Hi"
end

post "/" do
  content_type :json
  dialogue_flow_request = DialogueFlow::Request.new(request.body.read.to_s)
  resp = dialogue_flow_request.intent_handler.handle
  resp.to_json
end
