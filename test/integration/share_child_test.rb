# frozen_string_literal: true

require 'test_helper'

class ShareAChildTest < ActionDispatch::IntegrationTest
  def setup
    @parent_user = users(:archer)
    @other_user = users(:lana)
    @child = children(:tom)
  end

  test 'redirect to login when non parent show child_password' do
    log_in_as(@other_user)
    get family_path(@child.id)
    follow_redirect!
    assert_template 'sessions/new'
  end

  test 'invalid share a child' do
    log_in_as(@other_user)
    assert_no_difference 'Family.count' do
      post families_path, params: { family: { child_id: @child.id + 1,
                                              child_name: @child.name,
                                              child_password: @child.child_password,
                                              user_id: @other_user.id } }
    end
    assert_no_difference 'Family.count' do
      post families_path, params: { family: { child_id: @child.id,
                                              child_name: 'wrong_name',
                                              child_password: @child.child_password,
                                              user_id: @other_user.id } }
    end
    assert_no_difference 'Family.count' do
      post families_path, params: { family: { child_id: @child.id,
                                              child_name: @child.name,
                                              child_password: 'wrong_pass',
                                              user_id: @other_user.id } }
    end
    assert_template 'families/new'
  end

  test 'valid share a child' do
    log_in_as(@other_user)
    assert_difference 'Family.count', 1 do
      post families_path, params: { family: { child_id: @child.id,
                                              child_name: @child.name,
                                              child_password: @child.child_password,
                                              user_id: @other_user.id } }
    end
    follow_redirect!
    assert_template 'children/show'
  end
end
