require "test_helper"

class SubscribersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @subscriber = subscribers(:one)
  end

  test "create: success" do
    assert_difference "Subscriber.count" do
      post subscribers_path, params: { subscriber: { email: "ola@example.com"}}
    end
    assert_response :success
  end

  test "create: should send a verification email" do
    assert_enqueued_emails 1 do
      post subscribers_path, params: { subscriber: { email: "hi@example.com" }}
    end

    assert_response :success
  end

  test "show: should confirm email" do
    sid = @subscriber.email_confirmation_tokens.create.signed_id(expires_in: 2.days)

    get confirmation_subscribers_path(sid: sid)

    assert_redirected_to root_url
    assert_equal true, @subscriber.reload.confirmed?
  end

  test "show: should not confirm email with expired token" do
    sid_exp = @subscriber.email_confirmation_tokens.create.signed_id(expires_in: 0.minutes)

    get confirmation_subscribers_path(sid: sid_exp, id: @subscriber.id)

    assert_redirected_to root_path
    assert_equal "That email verification link is invalid", flash[:alert]
    assert_equal false, @subscriber.reload.confirmed?
  end

  test "create: failure" do
    assert_no_difference "Subscriber.count" do
      post subscribers_path, params: { subscriber: { email: "example.com"}}
    end
    assert_response :success
  end
end
