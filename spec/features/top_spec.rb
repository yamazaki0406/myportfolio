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

  it 'アカウントの新規作成・ログインが機能していることを確認' do
    expect(page).to have_link 'アカウントの新規作成', href: signup_path
    expect(page).to have_link 'ログイン', href: login_path
    click_button '簡単ログイン'
    pending
    expect(current_path).to eq child_path(3)
  end
end
