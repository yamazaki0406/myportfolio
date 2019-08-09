require 'test_helper'

 class UsersSignupTest < ActionDispatch::IntegrationTest
   test "invalid signup information"do
      get signup_path
      assert_no_difference "User.count" do
        post users_path, params:{user:{name: "",
                                       email: "user@invalid",
                                       password: "abc",
                                       password_confirmation: "def"}}
      end
     assert_template "users/new"
   end

   test "valid signup information"do
      get signup_path
      assert_difference "User.count",1 do
        post users_path, params:{user:{name: "TestUser",
                                       email: "user@example.com",
                                       password: "password",
                                       password_confirmation: "password"}}
      end
     follow_redirect!
     assert_template "children/new"
     assert is_logged_in?
     assert_not flash.empty?
   end
end
