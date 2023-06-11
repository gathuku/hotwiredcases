require "test_helper"

class SubscriberMailerTest < ActionMailer::TestCase
  setup do
    @subscriber = subscribers(:one)
  end

  test "email_verification" do
    mail = SubscriberMailer.with(subscriber: @subscriber).email_confirmation
    assert_equal "Confirm your subscription", mail.subject
    assert_equal [@subscriber.email], mail.to
  end
end
