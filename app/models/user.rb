class User < ActiveRecord::Base
  has_many :created_challenges, :class_name => 'Challenge', :foreign_key => 'creator_id'
  has_many :participations
  has_many :participating_challenges, :through => :participations, :source => :challenge
end
