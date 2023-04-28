require "test_helper"

class ExamplesControllerTest < ActionDispatch::IntegrationTest
  test "show" do
    example = examples(:one)
    get example_path(example)
    assert_response :ok
  end
end
