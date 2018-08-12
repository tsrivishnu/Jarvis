module DigitalOcean
  class Configuration
    attr_accessor :access_token, :ssh_key_name

    def initialize
      @access_token = nil
      @ssh_key_name = nil
    end

    def client
      raise "No access token" if access_token.nil?
      @_client ||= DropletKit::Client.new(access_token: access_token)
    end
  end
end
