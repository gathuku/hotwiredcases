require "test_helper"

class SubscriberTest < ActiveSupport::TestCase
  test "fixtures" do
    assert subscribers.all?(&:valid?)
  end
end
