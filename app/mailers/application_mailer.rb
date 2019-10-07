# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'myportfolio@childport.net'
  layout 'mailer'
end
