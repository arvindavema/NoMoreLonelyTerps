class Holla < ApplicationRecord
  scope :sorted, -> { order(created_at: :desc) }
  belongs_to :user
  has_one_attached :image

  has_many :likes
  has_many :hates

  has_many :comments, as: :commentable
  def posted_at
    self.humanize_elapsed(Time.now - self.created_at)
  end

  private

  def humanize_elapsed(ago)
    if ago < 60
      "just now"
    else
      minutes = ago / 60
      if (minutes < 60)
         "#{minutes} minutes ago"
      else
        hours = minutes / 60
        if hours < 24
          "#{hours} hours ago"
        else
          days = hours / 24
          if days < 7
             "#{days} days ago"
          else
            weeks = days / 7
            if weeks < 4
              "#{weeks} weeks ago"
            else
              months = weeks / 4
              if (months <11)
                "#{months} months ago"
              else
                 "#{months/12} years ago"
              end
            end
          end
        end
      end
    end
  end

end
