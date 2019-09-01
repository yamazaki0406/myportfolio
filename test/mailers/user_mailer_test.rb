require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  test "share_child" do
    user = users(:archer)
    child = children(:tom)
    mail = UserMailer.share_child(user, child)
      assert_equal "子育て共有アプリからのお知らせ", mail.subject
      assert_equal [], mail.to
      assert_equal ["from@example.com"], mail.from
  end

end
