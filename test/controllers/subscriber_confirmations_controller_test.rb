require "test_helper"

class SubscriberConfirmationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @subscriber = subscribers(:one)
  end

  test "confirm: should confirm email" do
    sid = @subscriber.email_confirmation_tokens.create.signed_id(expires_in: 2.days)

    get subscriber_confirmation_path(@subscriber, sid: sid)

    assert_redirected_to root_url
    assert_equal true, @subscriber.reload.confirmed?
  end

  test "confirm: should not confirm email with expired token" do
    sid_exp = @subscriber.email_confirmation_tokens.create.signed_id(expires_in: 0.minutes)

    get subscriber_confirmation_path(@subscriber, sid: sid_exp)

    assert_redirected_to root_path
    assert_equal "That email verification link is invalid", flash[:alert]
    assert_equal false, @subscriber.reload.confirmed?
  end
end
