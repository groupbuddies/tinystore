class CheckoutMailer < ActionMailer::Base

  layout 'email'
  default css: ['email']
  default from: ActionMailer::Base.smtp_settings[:user_name]

  def to_store(checkout_id)
    @checkout = Checkout.find(checkout_id)
    @store = @checkout.store
    mail to: @store.email, subject: 'New Order'
  end

  def to_client(checkout_id)
    @checkout = Checkout.find(checkout_id)
    @store = @checkout.store
    mail to: @checkout.client_email, subject: 'Your order'
  end
end
