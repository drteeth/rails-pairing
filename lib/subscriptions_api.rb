class SubscriptionsApi

  def self.register_subscription(product_id, email)
    @calls ||= []
    @calls << { user: email, product_id: product_id }
  end

end
