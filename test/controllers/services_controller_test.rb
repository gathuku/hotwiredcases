require "test_helper"

class ServicesControllerTest < ActionDispatch::IntegrationTest
  test "index" do
    get services_url
    assert_response :success
  end
end
