class MessageComponent < ViewComponent::Base
  include ActionView::RecordIdentifier

  def initialize(message:)
    @message = message
  end

  private

  attr_reader :message

  delegate :body, :created_at, to: :message, prefix: true

  def recent_message?
    message.created_at > 1.hour.ago
  end

  def timestamp
    message.created_at.strftime("%Y-%m-%d at %H:%M")
  end

  def message_classes
    class_names(
      "mr-10",
      "text-green-500" => recent_message?,
      "text-gray-500" => !recent_message?
    )
  end
end
