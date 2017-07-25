require "application_system_test_case"

class SubscriptionsTest < ApplicationSystemTestCase
  include ActiveJob::TestHelper

  test "visiting the form" do
    visit new_subscription_url

    fill_in "subscription[name]", with: "Bob Ross"
    fill_in "subscription[email]", with: "bob@example.com"
    fill_in "subscription[password]", with: "secret123"
    fill_in "subscription[password_confirmation]", with: "secret123"
    select "Humblebrag Goth", from: "subscription[product_id]"

    click_on "Subscribe"

    # We see a success message
    assert_selector ".flash.notice", text: "Bob Ross, you are now subscribed to Humblebrag Goth"

    # Both emails went out
    user_mail, subscription_mail = enqueued_jobs.map { |job| job.fetch(:args).take(2).join("#") }
    assert_equal "UserMailer#welcome_new_user", user_mail
    assert_equal "SubscriptionMailer#confirm_subscription", subscription_mail

    # A call to the API was made
    assert_equal 1, SubscriptionsApi.calls.size
  end

end
