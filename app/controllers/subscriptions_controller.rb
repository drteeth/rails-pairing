class SubscriptionsController < ApplicationController

  def new
    @subscription = SubscriptionForm.new
  end

  def create
    @subscription = SubscriptionForm.new(subscription_params)
    if @subscription.subscribe_new_user
      notice = I18n.t(:confirm_subscription,
        user_name: @subscription.user.name,
        product_name: @subscription.product.name)
      redirect_to new_subscription_url, notice: notice
    else
      render :new
    end
  end

  private

  def subscription_params
    params.require(:subscription).permit(
      :name,
      :email,
      :password,
      :password_confirmation,
      :product_id,
    )
  end
end
