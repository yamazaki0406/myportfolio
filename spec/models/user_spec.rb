# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { build(:user) }

  it '適切なユーザーが登録できることを確認' do
    expect(user).to be_valid
  end

  it '名前が無効な場合、登録できないことを確認' do
    user.name = '   '
    expect(user).to be_invalid
    user.name = 'a' * 51
    expect(user).to be_invalid
    user.name = '適切な名前に修正'
    expect(user).to be_valid
  end

  it 'アドレスが無効な場合、登録できないことを確認' do
    user.email = '   '
    expect(user).to be_invalid
    user.email = 'a' * 244 + '@example.com'
    expect(user).to be_invalid
    user.email = 'rspec_sample_test@example.com'
    expect(user).to be_valid
  end

  it '有効なアドレスはバリデーションを通過することを確認' do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      user.email = valid_address
      expect(user).to be_valid
    end
  end

  it '無効なアドレスはバリデーションに引っかかることを確認' do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      user.email = invalid_address
      expect(user).to be_invalid
    end
  end

  it '既に存在するアドレスと同一のアドレスは登録できないことを確認' do
    user.save
    duplicate_user = user.dup
    duplicate_user.email = user.email.upcase
    expect(duplicate_user).to be_invalid
  end

  it '登録時には、アドレスは小文字で登録されることを確認' do
    mixed_case_email = 'Foo@ExAMPle.CoM'
    user.email = mixed_case_email
    user.save
    expect(user.reload.email).to eq mixed_case_email.downcase
  end

  it 'パスワードが入力されていないと登録できないことを確認' do
    user.password = user.password_confirmation = ' ' * 6
    expect(user).to be_invalid
  end

  it 'パスワードが短すぎると登録できないことを確認' do
    user.password = user.password_confirmation = 'a' * 5
    expect(user).to be_invalid
  end

  it 'authenticated?メソッドが機能していることを確認' do
    expect(user.authenticated?('')).to be false
  end
end
