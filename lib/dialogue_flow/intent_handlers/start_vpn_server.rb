module DialogueFlow
  module IntentHandlers
    class StartVPNServer < Base
      def handle
        if request.params["location"].empty?
          # Dialogue flow will already handle this for us.
          return nil
        end

        {
          "fulfillmentMessages": [
            {
              "text": {
                "text": [
                  "I will start the server"
                ]
              }
            }
          ]
        }
      end
    end
  end
end
