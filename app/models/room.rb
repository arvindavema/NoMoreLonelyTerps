class Room < ApplicationRecord
  scope :is_public, -> { where public: true }
  scope :owned_by, -> (user) {where('owner_id = ?', user)}

  validates :name, presence: true, on: [:create, :update]
  validates :name, uniqueness: true, on: [:create, :update]
  validates :owner_id, presence: true
  
  has_many :room_msgs, dependent: :destroy, inverse_of: :room

  def Room.relevant(user)
    (Room.is_public + Room.owned_by(user.id)).uniq
  end


  def owner? user
    user.id == self.owner_id
  end

  #default is set to true
  def public?
    self.public
  end
end
