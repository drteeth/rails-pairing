class SubscriptionMailer < ApplicationMailer
  def confirm_subscription(subscription)
    @subscription = subscription
    mail to: subscription.user, subject: "Confirming your subscription"
  end
end
