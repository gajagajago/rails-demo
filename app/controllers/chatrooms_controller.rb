class ChatroomsController < ApplicationController
  def index
    @chatroom = Chatroom.all
  end

  def show
    @chatroom = Chatroom.find_by(id: params[:id])
    @messages = @chatroom.messages
  end

  def new
    @chatroom = Chatroom.new
  end

  def create
    byebug
    @chatroom = Chatroom.create
    redirect_to @chatroom
  end
end
