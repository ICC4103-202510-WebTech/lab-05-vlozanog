class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :redirect_unless_admin, only: [:index]
  load_and_authorize_resource

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @user_chats = (@user.sent_chats + @user.received_chats).uniq
    @messages = @user.messages
  end

  def new 
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
        redirect_to @user, notice: 'User created successfully.'
    else
        render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to @user, notice: 'User updated successfully.'
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path
  end

  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email)
    end

    def redirect_unless_admin
      unless current_user.admin?
        redirect_to root_path, alert: 'Access denied.'
    end
  end
end
