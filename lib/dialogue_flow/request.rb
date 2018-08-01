module DialogueFlow
  class Request
    def initialize(request_body)
      @req_hash = JSON.parse(request_body)
    end

    def intent_handler
      # handler_class = "DialogueFlow::IntentHandlers::#{intent_name}".constantize
      handler_class = DialogueFlow::IntentHandlers::StartVPNServer
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
