class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.share_child.subject
  #
  def share_child(user, child, address)
    @user = User.find(user)
    @child = Child.find(child)
    @new_parent_address = address
    mail to: @new_parent_address, subject: "子育て共有アプリからのお知らせ"
  end
end
