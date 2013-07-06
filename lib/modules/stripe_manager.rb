module StripeManager
  def charge
    Stripe.api_key = ENV["STRIPE_API_KEY"]
    token = params[:stripeToken]

    #Create the charge on Stripe's servers - this will charge the user's card
    begin
      charge = Stripe::Charge.create(
        :amount => 1000, # amount in cents, again
        :currency => "usd",
        :card => token,
        :description => "payinguser@example.com"
      )
    rescue Stripe::CardError => e
      puts e
      # The card has been declined
    end
  end
end
