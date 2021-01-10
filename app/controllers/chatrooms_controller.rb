class ChatroomsController < ApplicationController
  def index
    @chatroom = Chatroom.all
  end

  def show
    @chatroom = Chatroom.find_by(id: params[:id])
    @messages = @chatroom.messages
  end
end
