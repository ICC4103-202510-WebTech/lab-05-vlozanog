class MessagesController < ApplicationController
  before_action :authenticate_user!

  def index
    @messages = Message.all
  end

  def show
    @message = Message.find(params[:id])
  end

  def new
    @message = Message.new
  end
  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to @message, notice: 'Message created successfully.'
    else
      render :new
    end
  end

  def edit
    @message = Message.find(params[:id])
  end
  
  def update
    @message = Message.find(params[:id])
    if @message.update(message_params)
      redirect_to @message, notice: 'Message updated successfully.'
    else
      render :edit
    end
  end

  def destroy
    @message = Message.find(params[:id])
    @message.destroy
    redirect_to messages_path, notice: 'Message deleted successfully.'
  end

  private
  def message_params
    params.require(:message).permit(:chat_id, :user_id, :body)
  end
end
