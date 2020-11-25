class Comment < ApplicationRecord
  scope :sorted, -> { order(created_at: :desc) }
  
  belongs_to :commentable, polymorphic: true
  has_many :comments, as: :commentable

  def get_limited_replies
    x = self.loop_count

    if x == 0
      self.comments.sorted.limit(10)
    elsif x == 1
      self.comments.sorted.limit(5)
    else
      self.comments.sorted.limit(1)
    end
  end
end
