class CheckoutController < ApplicationController
    #require 'stripe'

    #Stripe.api_key = Rails.configuration.stripe[:secret_key]

    #YOUR_DOMAIN = 'http://localhost:3000' # Change the port to your Rails server port

  #def create
    #@total = params[:total].to_d
    #@session = Stripe::Checkout::Session.create(
      #payment_method_types: ['card'],
      #line_items: [
        #{
          #price_data: {
#             currency: 'eur',
#             unit_amount: (@total*100).to_i,
#             product_data: {
#               name: 'Rails Stripe Checkout',
#             },
#           },
#           quantity: 1
#         },
#       ],
#       mode: 'payment',
#       success_url: checkout_success_url + '?session_id={CHECKOUT_SESSION_ID}',
#       cancel_url: checkout_cancel_url
#     )
#     redirect_to @session.url, allow_other_host: true
#   end

#   def success
#     @session = Stripe::Checkout::Session.retrieve(params[:session_id])
#     @payment_intent = Stripe::PaymentIntent.retrieve(@session.payment_intent)
#   end

#   def cancel
#   end
end