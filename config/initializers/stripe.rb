require "stripe"
Stripe.api_key = ENV['STRIPE_API_KEY']
STRIPE_PUBLIC_KEY = ENV['STRIPE_PUBLIC_KEY'] 


# StripeEvent.subscribe 'charge.succeeded' do |event|
#   ReceiptMailer.send_receipt(event.data.object).deliver
# end

class BillingEventLogger
  def initialize(logger)
    @logger = logger
  end

  def call(event)
    @logger.info "BILLING:#{event.type}:#{event.id}"
  end
end

class CustomerCreated
  def call(event)
    # Event handling
  end
end

StripeEvent.configure do |events|
  events.all BillingEventLogger.new(Rails.logger)
  events.subscribe 'customer.created', CustomerCreated.new
end


