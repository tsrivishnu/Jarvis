module DialogueFlow
  module IntentHandlers
    class StopVPNServer < Base
      def handle
        return {
          "fulfillmentMessages": [
            {
              "text": {
                "text": [
                  "Delete initiated."
                ]
              }
            }
          ],
          "payload": {
            "google": {
              "expectUserResponse": true,
              "richResponse": {
                "items": [
                  {
                    "simpleResponse": {
                      "textToSpeech": "this is a simple response"
                    }
                  }
                ]
              }
            }
          }
        }

        if running_vpn_servers.count > 0
          if running_vpn_servers.count == 1
            # Delete it
            {
              "fulfillmentMessages": [
                {
                  "text": {
                    "text": [
                      "Delete initiated."
                    ]
                  }
                }
              ]
            }
          else
            # Ask for which one.
          end
        else
          # No running vpn servers
        end
      end

      private

      def running_vpn_servers
        @_running_vpn_servers ||= DigitalOcean::Droplet.all(tag: :openvpn)
      end
    end
  end
end
