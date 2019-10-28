# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Tops', type: :feature do
  before do
    visit root_path
  end

  it 'タイトルが正しく記載されていることを確認' do
    expect(page).to have_content '子育て共有アプリ'
    expect(page).to have_content '～日々の成長を記録しよう～'
  end

  it '「アカウントの新規作成」ボタンが機能していることを確認' do
    click_link 'アカウントの新規作成'
    expect(current_path).to eq signup_path
  end

  it '「ログイン」ボタンが機能していることを確認' do
    click_link 'ログイン'
    expect(current_path).to eq login_path
    # 簡単ログイン機能は、使用頻度が高く目視で確認できるため、テストから一旦除外
  end
end
