require "test_helper"

class SubscriberMailerTest < ActionMailer::TestCase
  setup do
    @subscriber = subscribers(:one)
  end

  test "email_verification" do
    mail = SubscriberMailer.with(subscriber: @subscriber).email_confirmation

    assert_emails 1 do
      mail.deliver_later
    end

    assert_equal "Confirm your subscription", mail.subject
    assert_equal ["from@example.com"], mail.from
    assert_equal [@subscriber.email], mail.to
    assert_match "Yes, use this email.", mail.body.encoded
  end
end
