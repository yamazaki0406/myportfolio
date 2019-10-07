# frozen_string_literal: true

require 'test_helper'

class FamilysControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:michael)
    @child = children(:tom)
  end

  test 'should get new' do
    get new_family_path
    assert_response :success
  end
end
