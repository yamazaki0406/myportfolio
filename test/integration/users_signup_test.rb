# frozen_string_literal: true

require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:michael)
  end

  test 'invalid & valid signup information' do
    get signup_path
    # ここから無効なユーザー登録のテスト
    assert_no_difference 'User.count' do
      post users_path, params: { user: { name: '',
                                         email: 'user@invalid',
                                         password: 'abc',
                                         password_confirmation: 'def' } }
    end
    assert_template 'users/new'
    # ここから有効なユーザー登録のテスト
    assert_difference 'User.count', 1 do
      post users_path, params: { user: { id: 200,
                                         name: 'TestUser',
                                         email: 'user@example.com',
                                         password: 'password',
                                         password_confirmation: 'password' } }
    end
    follow_redirect!
    assert_template 'children/new'
    assert is_logged_in?
    assert_not flash.empty?
  end

  test 'invalid & valid create a child' do
    log_in_as(@user)
    # ここから無効な子どもの登録テスト
    follow_redirect!
    assert_template 'children/new'
    assert_no_difference 'Child.count' do
      post children_path, params: { child: { name: '',
                                             sex: '',
                                             birthday: '2019-07-27',
                                             user_id: @user.id } }
    end
    assert_template 'children/new'
    # ここから有効な子どもの登録テスト
    assert_difference 'Child.count', 1 do
      post children_path, params: { child: { name: 'Tom Tanaka',
                                             sex: '男の子',
                                             birthday: '2019-07-27',
                                             user_id: @user.id } }
    end
    follow_redirect!
    assert_template 'children/show'
  end
end
