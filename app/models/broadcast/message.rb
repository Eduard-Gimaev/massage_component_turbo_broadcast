module Broadcast
  class Message
    def self.append(message:)
      new(message).append
    end

    def initialize(message)
      @message = message
    end

    def append
      puts "Appending message: #{@message}"
      puts "Broadcasting message: #{@message.id}"
      Turbo::StreamsChannel.broadcast_append_later_to(
        :messages,
        target: "messages",
        html: rendered_component
      )
    end

    private

    attr_reader :message

    def rendered_component
      puts "Rendering component for message: #{@message}"
      puts "Rendering component for message: #{@message.id}"
      html = ApplicationController.renderer.render(

        MessageComponent.new(message: message),
        layout: false
      )
      puts "Rendered HTML: #{html}"
      html
    end
  end
end
