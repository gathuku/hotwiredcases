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

    assert_equal "Hotwiredcases: confirm your subscription", mail.subject
    assert_equal ["hey@gathuku.me"], mail.from
    assert_equal ["hey@example.com"], mail.to
    assert_match "Yes, use this email.", mail.body.encoded
  end

  test "new_message" do
    message = subscriber_messages(:one)
    message.update(content: "<p>Hey there!</p>")

    mail = SubscriberMailer.with(subscriber: @subscriber, message: message).new_message

    assert_emails 1 do
      mail.deliver_later
    end

    assert_equal "This week Hotwired case", mail.subject
    assert_equal ["hey@gathuku.me"], mail.from
    assert_equal ["hey@example.com"], mail.to
    assert_match "Hey", mail.body.encoded
  end
end
