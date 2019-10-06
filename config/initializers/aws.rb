ActionMailer::Base.add_delivery_method(
  :ses,
  AWS::SES::Base,
  access_key_id: "AKIA3QMNVAZGYLDZLBKR",
  secret_access_key: "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",
  server: 'email.us-east-1.amazonaws.com'
