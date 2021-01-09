class MessagesController < ApplicationController
  before_action :require_user

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    @message.user = current_user

    if !@message.save
      flash[:alert] = "채팅 중 오류가 발생했습니다."
    end

    redirect_to chatroom_path
  end

  private
  def message_params
    params.require(:message).permit(:message)
  end
end
