# frozen_string_literal: true

FactoryGirl.define do
  factory :user do
    name 'テスト用ユーザー'
    email 'rspec_sample_test@example.com'
    password 'abcabc'
    password_confirmation 'abcabc'
  end
end
