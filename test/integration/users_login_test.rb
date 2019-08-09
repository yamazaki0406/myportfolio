require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest

 def setup
  @user = users(:michael)
 end

test "login with invalid information"do
  get login_path
  assert_template "sessions/new"
  post login_path, params:{session:{email:"",password:""}}
  assert_template "sessions/new"
  assert_not flash.empty?
  get root_path
  assert flash.empty?
end

 test "login with valid information followed by logout" do
   get login_path
   post login_path, params: {session:{email: @user.email, password: "password"}}
   assert is_logged_in?
   assert_redirected_to new_child_url #実際は子どもの有無で対応を分けたい(暫定的にいない設定で進めている)
   follow_redirect!
   assert_template "children/new"
   assert_select "a[href = ?]", login_path, count:0
   assert_select "a[href = ?]", logout_path
   assert_select "a[href = ?]", user_path(@user)
   delete logout_path
   assert_not is_logged_in?
   assert_redirected_to root_path
   delete logout_path
   follow_redirect!
   assert_select "a[href = ?]", login_path
   assert_select "a[href = ?]", logout_path, count:0
   assert_select "a[href = ?]", user_path(@user), count:0
 end

 test "login with remembering" do
   log_in_as(@user, remember_me: '1')
   assert_not_empty cookies['remember_token']
 end

 test "login without remembering" do
   # クッキーを保存してログイン
   log_in_as(@user, remember_me: '1')
   delete logout_path
   # クッキーを削除してログイン
   log_in_as(@user, remember_me: '0')
   assert_empty cookies['remember_token']
 end

end
