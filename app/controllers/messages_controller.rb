class MessagesController < ApplicationController
  before_action :require_user

  def new
    @message = Message.new
  end

  def create
    byebug
    # @message = Message.new(message_params)
    @message = current_user.messages.build(message_params)

    if !@message.save
      flash[:alert] = "채팅 중 오류가 발생했습니다."
    else
      # ActionCable.server.broadcast "chatroom_channel",
      #                              mod_message: message_render(@message)
    end

    redirect_to @message.chatroom
  end

  private
  def message_params
    params.require(:message).permit(:message, :chatroom_id)
  end

  def message_render(message)
    render(partial: 'message', locals: { message: message })
  end
end
