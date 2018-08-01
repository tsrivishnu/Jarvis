require_relative 'dialogue_flow/request'
require_relative 'dialogue_flow/intent_handlers/base'

# require all intent handlers
Dir[File.join(__dir__, 'dialogue_flow/intent_handlers', '**/*.rb')].each { |file|
  require file
}

module DialogueFlow

end
