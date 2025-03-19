class MessageCounterComponent < ViewComponent::Base
  def initialize(messages:)
    @messages = messages
  end

  def count
    @messages.size
  end
end
