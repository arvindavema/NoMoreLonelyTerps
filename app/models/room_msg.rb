class RoomMsg < ApplicationRecord
  belongs_to :room, inverse_of: :room_msgs
  belongs_to :user, inverse_of: :room_msgs 
end
