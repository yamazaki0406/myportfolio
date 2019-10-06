require 'test_helper'

class ChildrenControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get new_child_url
    assert_response :success
  end

end
