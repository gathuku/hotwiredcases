require "test_helper"

class Subscriber::ConfirmationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @subscriber = subscribers(:one)
  end

  test "confirm: should confirm email" do
    sid = @subscriber.email_confirmation_tokens.create.signed_id(expires_in: 2.days)

    get confirmation_subscribers_path(sid: sid)

    assert_redirected_to root_url
    assert_equal true, @subscriber.reload.confirmed?
  end

  test "confirm: should not confirm email with expired token" do
    sid_exp = @subscriber.email_confirmation_tokens.create.signed_id(expires_in: 0.minutes)

    get confirmation_subscribers_path(sid: sid_exp, id: @subscriber.id)

    assert_redirected_to root_path
    assert_equal "That email verification link is invalid", flash[:alert]
    assert_equal false, @subscriber.reload.confirmed?
  end
end
