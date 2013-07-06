class Challenge < ActiveRecord::Base

  belongs_to :creator, :class_name => "User"
  has_many :participations
  has_many :participants, :through => :participations, :source => :user

  def creator?(user)
    user.id == self.creator_id
  end

end
