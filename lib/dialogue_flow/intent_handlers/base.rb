module DialogueFlow
  module IntentHandlers
    class Base
      attr_reader :request

      def initialize(request)
        @request = request
      end

      def handle
        raise "Override '#handler'"
      end
    end
  end
end
