require "test_helper"

class SubscriberConfirmationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @subscriber = subscribers(:one)
    assert_equal false, @subscriber.reload.confirmed?
  end

  test "confirm: should confirm email" do
    get subscriber_confirmation_path(@subscriber.to_sgid.to_s)
    assert_equal true, @subscriber.reload.confirmed?

    assert_redirected_to root_url
  end

  test "confirm: should not confirm email with expired token" do
    get subscriber_confirmation_path(@subscriber.to_sgid(expires_in: 0.seconds))
    assert_equal "That email verification link is invalid", flash[:alert]
    assert_equal false, @subscriber.reload.confirmed?
    assert_redirected_to root_path
  end
end
