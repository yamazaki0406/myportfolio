# frozen_string_literal: true

require 'test_helper'

class GrowthsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @growth = growths(:one)
    @user = users(:archer)
    @child = children(:tom)
    @other = users(:lana)
  end

  test 'should redirect create when not logged in' do
    assert_no_difference 'Growth.count' do
      post growths_path, params: { growth: { date: 2019 - 0o7 - 27,
                                             height: 1.5,
                                             weight: 1.5 } }
    end
    assert_redirected_to login_url
  end

  test 'should redirect destroy when not loggged in' do
    assert_no_difference 'Growth.count' do
      delete micropost_path(@growth)
    end
    assert_redirected_to login_url
  end

  test 'should redirect destroy when other user' do
    log_in_as(@other)
    assert_no_difference 'Growth.count' do
      delete growth_path(@growth)
    end
    assert_redirected_to detail_growth_path
  end

  test 'should destroy when correct user' do
    log_in_as(@user)
    assert_difference 'Growth.count', -1 do
      delete growth_path(@growth)
    end
    assert_redirected_to growths_path
  end
end
