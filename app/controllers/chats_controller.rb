class ChatsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    @chats = Chat.user_can_see(current_user)
  end

  def show
    @chat = Chat.find(params[:id])
    @messages = @chat.messages.includes(:user)
  end

  def new
    @chat = Chat.new
  end

  def create
    @chat = Chat.new(chat_params)
    if @chat.save
      redirect_to @chat, notice: 'Chat created successfully.'
    else
      render :new
    end
  end

  def edit
    @chat = Chat.find(params[:id])
  end

  def update
    @chat = Chat.find(params[:id])
    if @chat.update(chat_params)
      redirect_to @chat, notice: 'Chat updated successfully.'
    else
      render :edit
    end
  end

  private
  def chat_params
    params.require(:chat).permit(:sender_id, :receiver_id)
  end
end
