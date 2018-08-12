require_relative "config/application.rb"
# require "sinatra/reloader" if development?

binding.pry
class JarvisBackend < Sinatra::Base
  register Sinatra::ConfigFile

  set :bind, '0.0.0.0'

  configure do
    enable :logging # This logs only to STDOUT, not to a file
  end

  config_file 'config/application.yml'

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

  run! if app_file == $0
end
