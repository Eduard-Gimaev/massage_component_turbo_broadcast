class MessagesController < ApplicationController
  before_action :find_message, only: %i[edit update destroy]

  def index
    @messages = Message.all
  end

  def create
    @message = Message.new(body: params[:body])
    if @message.save
      Broadcast::Message.append(message: @message)
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
  end

  private

  def find_message
    @message = Message.find(params[:id])
  end
end
