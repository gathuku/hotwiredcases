require "test_helper"

class SubscriberTest < ActiveSupport::TestCase
  include ActionMailer::TestHelper

  test "fixtures" do
    assert subscribers.all?(&:valid?)
  end

  test "send_mesage" do
    assert_emails 2 do
      Subscriber.send_message(subscriber_messages(:one))
    end
  end
end
