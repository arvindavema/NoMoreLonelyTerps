class UsersController < ApplicationController
  before_action :set_user, only: :show
  
  def index
    @users = User.all
  end

  def show
  end


  private

  def set_user
    @target = User.find(params[:id])
    if user_signed_in?
      @user = current_user
    else
      @user = nil
    end
  end
end
