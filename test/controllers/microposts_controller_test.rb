require 'test_helper'

class MicropostsControllerTest < ActionDispatch::IntegrationTest
 def setup
   @micropost = microposts(:one)
   @user = users(:archer)
   @child = children(:tom)
   @other = users(:lana)
 end

 test "should redirect create when not logged in"do
  assert_no_difference "Micropost.count" do
    post microposts_path, params:{micropost: {content: "Lorem ipsum"}}
  end
  assert_redirected_to login_url
 end

 test "should redirect destroy when not loggged in"do
   assert_no_difference "Micropost.count" do
     delete micropost_path(@micropost)
   end
   assert_redirected_to login_url
 end

 test "should redirect destroy when other user" do
   log_in_as(@other)
   assert_no_difference "Micropost.count" do
     delete micropost_path(@micropost)
   end
   assert_redirected_to microposts_path
 end

 test "should destroy when correct user" do
   log_in_as(@user)
   assert_difference "Micropost.count",-1 do
     delete micropost_path(@micropost)
   end
   assert_redirected_to microposts_path
 end

end
