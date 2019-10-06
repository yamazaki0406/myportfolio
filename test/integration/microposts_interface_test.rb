# frozen_string_literal: true

require 'test_helper'

class MicropostsInterfaceTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:archer)
    @child = children(:tom)
  end

  test 'page link' do
    log_in_as(@user)
    follow_redirect!
    assert_template 'children/show'
    get microposts_path
    assert_select 'a[href=?]', child_path(@child)
    assert_select 'a[href=?]', new_micropost_path
    get new_micropost_path
    assert_select 'a[href=?]', microposts_path
    assert_select 'a[href=?]', child_path(@child)
  end
end
