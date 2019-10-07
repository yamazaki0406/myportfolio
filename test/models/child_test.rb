# frozen_string_literal: true

require 'test_helper'

class ChildTest < ActiveSupport::TestCase
  def setup
    @user = User.create(name: 'サンプルユーザー',
                        email: 'sample@example.com',
                        password: 'abcabc',
                        password_confirmation: 'abcabc')
    @child = @user.children.build(name: '男の子(次男)',
                                  sex: '男の子',
                                  birthday: Date.today,
                                  user_id: @user.id)
  end

  test 'should be valid' do
    assert @child.valid?
  end

  test 'should name valid' do
    @child.name = '   '
    assert_not @child.valid?
    @child.name = 'a' * 51
    assert_not @child.valid?
  end

  test 'should sex valid' do
    @child.sex = '  '
    assert_not @child.valid?
  end

  test 'birthday should be present (nonblank)' do
    @child.birthday = Date.today + 1
    assert_not @child.valid?
  end

  test 'associated microposts should be destroyed' do
    @child.save
    @child.microposts.create!(content: 'Lorem ipsum', user_id: @user.id)
    assert_difference 'Micropost.count', -1 do
      @child.destroy
    end
  end
end
