module DialogueFlow
  module IntentHandlers
    class StopVPNServer < Base
      def handle
        if running_vpn_servers.count > 0
          # Delete all VPN servers
          running_vpn_servers.each do |droplet|
            droplet.destroy
          end
          {
            "payload": {
              "google": {
                "expectUserResponse": false,
                "richResponse": {
                  "items": [
                    {
                      "simpleResponse": {
                        "textToSpeech": "All VPN servers are deleted"
                      }
                    }
                  ]
                }
              }
            }
          }
        else
          {
            "payload": {
              "google": {
                "expectUserResponse": false,
                "richResponse": {
                  "items": [
                    {
                      "simpleResponse": {
                        "textToSpeech": "Ummm! No VPN servers are running."
                      }
                    }
                  ]
                }
              }
            }
          }
        end
      end

      private

      def running_vpn_servers
        @_running_vpn_servers ||= DigitalOcean::Droplet.all(tag: :openvpn)
      end
    end
  end
end
