class SubscriptionForm
  include ActiveModel::Model

  attr_accessor \
    :name,
    :email,
    :password,
    :password_confirmation,
    :product_id

  validates :name, presence: true
  validates :email, presence: true
  validates :password, presence: true
  validates :password_confirmation, presence: true
  validates :product_id, presence: true
  validate :password_is_confirmed

  def subscribe_new_user
    if valid?

    end
  end

  def product_list
    Product.pluck(:name, :id)
  end

  def user
    @subscription.try!(:user)
  end

  def product
    @subscription.try!(:product)
  end

  private

  def password_is_confirmed
    if password != password_confirmation
      errors.add :password_confirmation, "does not match"
    end
  end

end
