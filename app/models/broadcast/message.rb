module Broadcast
  class Message
    def self.append(message:)
      new(message).append
    end

    def initialize(message)
      @message = message
    end

    def append
      Turbo::StreamsChannel.broadcast_append_later_to(
        :messages,
        target: "messages",
        html: rendered_component
      )
    end

    def self.remove(message:)
      new(message).remove
    end

    def remove
      Turbo::StreamsChannel.broadcast_remove_to(
        :messages,
        target: "message_#{message.id}"
      )
    end

    private

    attr_reader :message

    def rendered_component
      ApplicationController.renderer.render(
        MessageComponent.new(message: message),
        layout: false
      )
    end
  end
end
