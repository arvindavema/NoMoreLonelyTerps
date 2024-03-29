class User < ApplicationRecord
  has_friendship
  # has_one_attatched :avatar
  attr_writer :login

  validates :user_name, presence: true , format: {with: /\A[a-zA-Z0-9]+\z/}, length: {in: 1..12}, uniqueness: {case_sensitive: false}
  validates :email, format: {with: /\A\S*@terpmail\.umd\.edu\z/, message:'you must provide your terpmail.umd.edu email! You can change your email later!'}
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, authentication_keys: [:login]


  has_many :hollas, dependent: :destroy, inverse_of: :user
  has_many :likes, dependent: :destroy, inverse_of: :user
  has_many :room_msgs, dependent: :destroy, inverse_of: :user

  def login
    @login || self.user_name || self.email
  end

  def likes?(holla)
    self.likes.find_by(holla: holla)
  end

  def self.find_for_database_authentication warden_condition
    conditions = warden_condition.dup
    login = conditions.delete(:login)
    where(conditions).where( ["lower(user_name) = :value OR lower(email) = :value",{ value: login.strip.downcase}]).first
  end

end
