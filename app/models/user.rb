require 'modules/human_api_manager'
class User < ActiveRecord::Base
  has_many :created_challenges, :class_name => 'Challenge', :foreign_key => 'creator_id'
  has_many :participations
  has_many :participating_challenges, :through => :participations, :source => :challenge

  def self.fetch_activity_data
    User.all.each do |user|
      activity_data = JSON.parse HumanApiManager.all_activity(user.humanapi_token).body
    end

    User.joins(:participating_challenges, :participations).where("challenges.end_date >= ?", Time.now.to_date).each do |user|
      # activity_data = JSON.parse HumanApiManager.all_activity(user.humanapi_token).body
      activity_data = JSON.parse HumanApiManager.all_activity('447b182358048beeb2aed22a430704e8f3e29d36').body
      user.participating_challenges.where("challenges.end_date >= ?", Time.now.to_date).each do |challenge|
        participation = user.participations.where('challenge_id = ?', challenge.id).first
        debugger
        participation.update_attributes(:amount => activity_data[challenge.activity_type])
      end
    end
  end
end