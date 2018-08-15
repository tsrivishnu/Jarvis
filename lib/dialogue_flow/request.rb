module DialogueFlow
  class Request
    def initialize(request_body)
      @req_hash = JSON.parse(request_body)
      puts @req_hash
    end

    def intent_handler
      handler_class = case intent_name
      when "StartVPNServer"
        DialogueFlow::IntentHandlers::StartVPNServer
      when "StopVPNServer"
        DialogueFlow::IntentHandlers::StopVPNServer
      end
      handler_class.new(self)
    end

    def params
      @req_hash["queryResult"]["parameters"]
    end

    private

    def intent_name
      @req_hash["queryResult"]["intent"]["displayName"]
    end
  end
end
