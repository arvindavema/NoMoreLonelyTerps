class UsersController < ApplicationController
  before_action :set_user
  before_action :set_target, only: :show

  def index
    @users = User.all
  end

  def show
  end

  def send_request
    @target = User.find_by(id: params[:user_id])
    @user.friend_request(@target) if @user != @target
    redirect_to @target
  end

  def block_friend
    @user.block_friend(@target) if @user != @target
    render 'show'
  end

  def unblock_friend
    @user.unblock_friend(@target) if @user != @target
    render 'show'
  end

  private
  def set_target
    @target = User.find_by(id: params[:id])
  end
  
  def set_user
    @user = current_user
  end
end
