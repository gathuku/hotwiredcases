require "test_helper"

class SubscribersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @subscriber = subscribers(:one)
  end

  test "create: success" do
    assert_difference "Subscriber.count" do
      post subscribers_path, params: {subscriber: {email: "ola@example.com"}}
    end
    assert_response :success
  end

  test "create: should send a verification email" do
    assert_enqueued_emails 1 do
      post subscribers_path, params: {subscriber: {email: "hi@example.com"}}
    end

    assert_response :success
  end

  test "create: failure" do
    assert_no_difference "Subscriber.count" do
      post subscribers_path, params: {subscriber: {email: "example.com"}}
    end
    assert_response :success
  end
end
