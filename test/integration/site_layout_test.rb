# frozen_string_literal: true

require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
  test 'layout links' do
    get root_path
    assert_template 'tops/index'
    assert_select 'a[href = ?]', signup_path
    assert_select 'a[href = ?]', login_path
  end
end
