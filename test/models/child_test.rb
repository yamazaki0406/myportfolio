require 'test_helper'

class ChildTest < ActiveSupport::TestCase
  def setup
   @user = User.create(name: "サンプルユーザー",
                       email: "sample@example.com",
                       password: "abcabc",
                       password_confirmation: "abcabc")
   @child = @user.build_child(name: "男の子(次男)",
                              sex: "男の子",
                              birthday: 2019-07-27)
  end

  test "should be valid" do
    assert @child.valid?
  end

  test "should name valid" do
    @child.name = "   "
    assert_not @child.valid?
    @child.name = "a"*51
    assert_not @child.valid?
  end

  test "should sex valid"do
    @child.sex = "  "
    assert_not @child.valid?
  end

  test "birthday should be present (nonblank)"do
    @child.birthday = " "
    assert_not @child.valid?
  end

  test "associated microposts should be destroyed" do
    @child.save
    @child.microposts.create!(content: "Lorem ipsum")
    assert_difference 'Micropost.count', -1 do
      @child.destroy
    end
  end

end
