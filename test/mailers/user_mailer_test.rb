# frozen_string_literal: true

require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  test 'share_child' do
    user = users(:archer).id
    child = children(:tom).id
    address = users(:archer).email
    mail = UserMailer.share_child(user, child, address)
    assert_equal '子育て共有アプリからのお知らせ', mail.subject
    assert_equal ['duchess@example.gov'], mail.to
    assert_equal ['myportfolio@childport.net'], mail.from
  end
end
