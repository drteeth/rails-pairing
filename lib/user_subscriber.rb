class UserSubscriber

  def subscribe(name:, email:, password:, product_id:)
    subscription = User.transaction do
      # create the new user
      user = User.create!(name: name, email: email, password: password)

      # create a subscription for the new user
      Subscription.create!(user: user, product_id: product_id)
    end

    # send the welcome email
    UserMailer.welcome_new_user(subscription.user).deliver_later

    # send the confirmation email
    SubscriptionMailer.confirm_subscription(subscription).deliver_later

    # register the subscription with some external service
    SubscriptionsApi.register_subscription(product_id, email)

    subscription
  end

end
