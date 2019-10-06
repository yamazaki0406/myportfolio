# frozen_string_literal: true

# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
  # Preview this email at http://192.168.33.10:3000/rails/mailers/user_mailer/share_child
  def share_child
    user = User.find(1).id
    child = Child.find(1).id
    address = 'sample@example.com'
    UserMailer.share_child(user, child, address)
  end
end
