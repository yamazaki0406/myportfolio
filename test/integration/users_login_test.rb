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

 test "login with valid information without & with a child) " do
 #子どもを登録していない状態でのログイン～ログアウト
   get login_path
   post login_path, params: {session:{email: @user.email, password: "password"}}
   assert is_logged_in?
   assert_redirected_to new_child_url
   follow_redirect!
   post children_path, params: {child: {name: "Tom Tanaka", sex: "男の子", birthday: "2019-07-27", user_id: @user.id}}
   follow_redirect!
   assert_template 'children/show'
   delete logout_path
   assert_not is_logged_in?
   assert_redirected_to root_path
 #子どもを登録した状態で再ログイン
   post login_path, params: {session:{email: @user.email, password: "password"}}
   follow_redirect!
   assert_template 'children/show'
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
