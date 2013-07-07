module StripeManager
  extend self

  Stripe.api_key = ENV["STRIPE_API_KEY"]

  def charge(amount, customer_id)
    #Create the charge on Stripe's servers - this will charge the user's card
    charge = Stripe::Charge.create(
      :amount => amount * 100, # Stripe deals with cents
      :currency => "usd",
      :customer => customer_id
    )
  end

  def create_customer(email)
    Stripe::Customer.create(email: email)
  end
end

