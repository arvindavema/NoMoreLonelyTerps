class ChatController < ApplicationController

  def index
    @user = current_user
    @rooms = Room.relevant(@user)
  end

end
