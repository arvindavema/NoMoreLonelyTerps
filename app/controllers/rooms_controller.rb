class RoomsController < ApplicationController
  before_action :load_room, except: [:index, :new]
  before_action :load_user

  def index
    @rooms = Rooms.all
  end

  def new
    @room = Room.new owner_id: @user.id
  end

  def show
    @rooms = Room.relevant(@user)
    @room_msg = RoomMsg.new room: @room
    @room_msgs = @room.room_msgs.includes(:user)
  end

  def create
   @room = Room.new room_params
   @room.owner_id = @user.id
   if @room.save
     flash[:success] = "Room #{@room.name} was created successfully"
     redirect_to room_path(@room)
   else
     render :new
   end
 end

 def edit
 end

 def update
   if @room.update_attributes(room_params)
     flash[:success] = "Room #{@room.name} was updated successfully"
     redirect_to room_path(@room)
   else
     render :new
   end
 end

 def destroyed
   @room.destroy
   respond_to do |format|
     flash[:success] = "Room #{@room.name} was deleted successfully"
     format.json { head :no_content }
   end
   redirect_to chat_path
 end

  private
  def load_room
    @room = Room.find(params[:id]) if params[:id]
  end

  def load_user
    @user = current_user
  end

  def room_params
    params.require(:room).permit(:name, :public, :owner_id)
  end
end
