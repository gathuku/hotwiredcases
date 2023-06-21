require "test_helper"

class Admin::MessagesControllerTest < ActionDispatch::IntegrationTest
  test "index" do
    get admin_messages_path
    assert_response :success
  end

  test "new" do
    get new_admin_message_path
    assert_response :success
  end

  test "create success" do
    assert_difference "SubscriberMessage.count" do
      post admin_messages_path, params: { subscriber_message: { content: "Hey"} }
    end
    assert_redirected_to admin_messages_path
  end

  test "create failure" do
    assert_no_difference "SubscriberMessage.count" do
      post admin_messages_path, params: { subscriber_message: { content: ""} }
    end
    assert_response :unprocessable_entity
  end
end
