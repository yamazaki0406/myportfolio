# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Child, type: :model do
  before do
    @user = User.create(name: 'テスト用ユーザー',
                        email: 'rspec_test@example.com',
                        password: 'abcabc',
                        password_confirmation: 'abcabc')
    @child = @user.children.build(name: 'テスト用の子ども(男の子)',
                                  sex: '男の子',
                                  birthday: Date.today,
                                  user_id: @user.id)
  end

  it '適切な子どもが登録できることを確認' do
    expect(@child).to be_valid
  end

  it '名前が無効な場合、登録できないことを確認' do
    @child.name = '   '
    expect(@child).to be_invalid
    @child.name = 'a' * 51
    expect(@child).to be_invalid
  end

  it '性別が無効な場合、登録できないことを確認' do
    @child.sex = '  '
    expect(@child).to be_invalid
  end

  it '誕生日が無効な場合、登録できないことを確認' do
    pending
    @child.birthday = ' '
    pending
    expect(@child).to be_invalid
    @child.birthday = Date.today + 1
    expect(@child).to be_invalid
  end

  it '子どものデータを削除した際、アルバムも一緒に削除されることを確認' do
    pending
    @child.save
    pending
    @child.microposts.create!(content: 'Lorem ipsum', user_id: @user.id)
    pending
    assert_difference 'Micropost.count', -1 do
      @child.destroy
    end
  end
end
