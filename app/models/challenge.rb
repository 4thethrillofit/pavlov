class Challenge < ActiveRecord::Base
  belongs_to :creator, :class_name => "User"
  has_many :participations
  has_many :participants, :through => :participations, :source => :user
  scope :active_challenges, -> { where(['end_date < ?', DateTime.now]) }
  scope :inactive_challenges, -> { where(['end_date > ?', DateTime.now]) }
  validates :start_date, :presence => true
  validates :end_date, :presence => true

  attr_accessor :participant_email

  def participant_email=(email)
    self.participants = User.find_by(:email => email)
  end

  def creator?(user)
    user.id == self.creator_id
  end

end
