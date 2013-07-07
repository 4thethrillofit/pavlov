require 'modules/human_api_manager'

class User < ActiveRecord::Base
  has_many :created_challenges, :class_name => 'Challenge', :foreign_key => 'creator_id'
  has_many :participations
  has_many :participating_challenges, :through => :participations, :source => :challenge

  def self.fetch_activity_data
    User.joins(:participating_challenges, :participations).where("challenges.end_date >= ?", Time.now.to_date).each do |user|
      activity_data = JSON.parse HumanApiManager.all_activity(user.humanapi_token).body
      # activity_data = JSON.parse HumanApiManager.all_activity('447b182358048beeb2aed22a430704e8f3e29d36').body
      user.participating_challenges.where("challenges.end_date >= ?", Time.now.to_date).each do |challenge|
        participation = user.participations.where('challenge_id = ?', challenge.id).first
        new_amount = participation.amount + activity_data[challenge.activity_type].to_i
        participation.update_attribute(:amount, new_amount)
      end
    end
  end

  def save_stripe_customer_id
    customer = StripeManager.create_customer(email)
    self.stripe_customer_id = customer.id
    save!
  end

  def current_participation(challenge)
    self.participations.where('challenge_id = ?', challenge).first
  end
end
