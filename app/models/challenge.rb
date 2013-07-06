class Challenge < ActiveRecord::Base
  attr_reader :creator_id

  belongs_to :creator, :class_name => "User"
  has_many :participations
  has_many :participants, :through => :participations, :source => :user

  def creator?(user)
    user.id == self.creator_id
  end
end
