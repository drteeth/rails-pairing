### The challenge:

Given a rails app with User, Product and Subscription models. Create a form for a user to register as a new user with an initial subscription to a product. The system will create a new user, with a subscription to a valid product. It will send out a welcome email to the new user and it will send an email confirming the subscription to the product. Finally it will register the subscription with a (fake) external service.

The subscriptions controller and new.html.erb have been started for you. Search for TODOs to complete make the test pass.  Keep in mind ways in which the various operations might fail. Also consider how the solution might be tested.

See the test at: https://github.com/drteeth/rails-pairing/blob/master/test/system/subscriptions_test.rb

The external API is here: https://github.com/drteeth/rails-pairing/blob/master/lib/subscriptions_api.rb

TODOs are in:
https://github.com/drteeth/rails-pairing/blob/master/app/controllers/subscriptions_controller.rb
https://github.com/drteeth/rails-pairing/blob/master/app/views/subscriptions/new.html.erb#L41
