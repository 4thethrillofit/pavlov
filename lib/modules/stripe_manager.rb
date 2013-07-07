module StripeManager
  extend self

  Stripe.api_key = ENV["STRIPE_API_KEY"]

  def create_customer(email)
    Stripe::Customer.create(email: email)
  end

  def create_recipient(name, email)
    Stripe::Recipient.create(name: "#{name} .", type: "individual", email: email,
                             bank_account: {country: 'US', routing_number: '110000000', account_number: '000123456789'})
  end

  def charge(amount, customer_id)
    Stripe::Charge.create(
      amount: amount * 100, # Stripe deals with cents
      currency: "usd",
      customer: customer_id,
      description: "Challenge lost"
    )
  end

  def transfer(amount, recipient_id)
    Stripe::Transfer.create(
      amount: amount * 100, # Stripe deals with cents
      currency: "usd",
      recipient: recipient_id,
      description: "Challenge won"
    )
  end
end

