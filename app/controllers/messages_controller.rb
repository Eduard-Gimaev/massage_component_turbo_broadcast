class MessagesController < ApplicationController
  before_action :find_message, only: %i[edit update destroy]
  after_action :publish_message, only: %i[create update destroy]

  def index
    @messages = Message.all
  end

  def create
    @message = Message.new(body: params[:body])
    if @message.save
      @messages = Message.all
      respond_to do |format|
        format.html { redirect_to messages_path }
        format.turbo_stream
      end
    end
  end

  def edit
  end
  def update
  end

  def destroy
    @message.destroy
    respond_to do |format|
      format.html { redirect_to messages_path }
      format.turbo_stream { render turbo_stream: turbo_stream.remove(@message) }
    end
  end

  private

  def find_message
    @message = Message.find(params[:id])
  end

  def publish_message
    ActionCable.server.broadcast("messages", {
      message: render_to_string(component: MessageComponent.new(message: @message))
    })
  end
end
