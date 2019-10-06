require 'test_helper'

class FamilysControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get new_family_url
    assert_response :success
  end

end
