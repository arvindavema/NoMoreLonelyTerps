class RoomMsgsController < ApplicationController
  before_action :load_entities

  def create
    @room_msg = RoomMsg.create user: @user, room: @room, msg: params.dig(:room_msg, :msg)

    RoomChannel.broadcast_to @room, @room_msg
    redirect_to room_path(@room)
  end

  private
  def load_entities
    @room = Room.find params.dig(:room_msg, :room_id)
    @user = current_user
  end

end
