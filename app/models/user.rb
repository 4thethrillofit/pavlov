class User < ActiveRecord::Base
  has_many :created_challenges, :class_name => 'Challenge', :foreign_key => 'creator_id'
  has_many :participations
  has_many :participating_challenges, :through => :participations, :source => :challenge

  def fetch
    Resque.enqueue(id)
  end

  def save_stripe_customer_id
    customer = StripeManager.create_customer(email)
    self.stripe_customer_id = customer.id
    save!
  end
end

