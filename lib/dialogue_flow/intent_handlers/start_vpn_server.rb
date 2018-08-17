module DialogueFlow
  module IntentHandlers
    class StartVPNServer < Base
      def handle
        # if request.params["location"].empty?
        #   # Dialogue flow will already handle this for us.
        #   return ask_location_response
        # end

        if running_vpn_servers.count > 0
          return vpn_already_running_response
        end

        DigitalOcean::Droplets::VPN.new.start
        return started_vpn_response
      end

      private

      def ask_location_response
        {
          "payload": {
            "google": {
              "expectUserResponse": true,
              "richResponse": {
                "items": [
                  {
                    "simpleResponse": {
                      "textToSpeech": "which location you ?"
                    }
                  }
                ]
              }
            }
          }
        }
      end

      def vpn_already_running_response
        {
          "payload": {
            "google": {
              "expectUserResponse": false,
              "richResponse": {
                "items": [
                  {
                    "simpleResponse": {
                      "textToSpeech": "Ummm! VPN is already running."
                    }
                  }
                ]
              }
            }
          }
        }
      end

      def started_vpn_response
        {
          "payload": {
            "google": {
              "expectUserResponse": false,
              "richResponse": {
                "items": [
                  {
                    "simpleResponse": {
                      "textToSpeech": "Sure! I started the VPN. Give it half a minute and it will be all ready."
                    }
                  }
                ]
              }
            }
          }
        }
      end

      def running_vpn_servers
        @_running_vpn_servers ||= DigitalOcean::Droplet.all(tag: :openvpn)
      end
    end
  end
end
