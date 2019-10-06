# frozen_string_literal: true

require 'test_helper'

class MicropostTest < ActiveSupport::TestCase
  def setup
    @user = users(:archer)
    @child = children(:tom)
    @micropost = @child.microposts.build(content: 'Lorem ipsum', user_id: @user.id)
  end

  test 'should be valid' do
    assert @micropost.valid?
  end

  test 'child is should be present' do
    @micropost.child_id = nil
    assert_not @micropost.valid?
  end

  test 'content should be present' do
    @micropost.content = ''
    assert_not @micropost.valid?
  end

  test 'content should be at most 250 characters' do
    @micropost.content = 'a' * 251
    assert_not @micropost.valid?
  end

  test 'order should be most recent first' do
    assert_equal microposts(:most_recent), Micropost.first
  end
end
