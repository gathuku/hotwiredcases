require "test_helper"

class SubscribersControllerTest < ActionDispatch::IntegrationTest
  test "create: success" do
    assert_difference "Subscriber.count" do
      post subscribers_path, params: { subscriber: { email: "hey@example.com"}}
    end
    assert_response :success
  end

  test "create: failure" do
    assert_no_difference "Subscriber.count" do
      post subscribers_path, params: { subscriber: { email: "example.com"}}
    end
    assert_response :success
  end
end
