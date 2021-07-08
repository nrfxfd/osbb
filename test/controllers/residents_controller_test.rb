require "test_helper"

class ResidentsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get residents_index_url
    assert_response :success
  end
end
