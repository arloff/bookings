# frozen_string_literal: true

require 'rails_helper'

describe 'login', type: :feature do
  before :each do
    @admin = create(:admin)
  end
  it 'login works and creates session' do
    visit new_user_session_path(locale: :de)
    fill_in t('activerecord.attributes.user.email'), with: @admin.email
    fill_in t('activerecord.attributes.user.password'), with: @admin.password
    click_button t('devise.sessions.sign_in')
    expect(page).to have_content t('devise.user.signed_in')
  end
  it 'login redirects to login page on wrong password' do
    visit new_user_session_path(locale: :de)
    fill_in t('activerecord.attributes.user.email'), with: @admin.email
    fill_in t('activerecord.attributes.user.password'), with:'not the password'
    click_button t('devise.sessions.sign_in')
    expect(page).to have_content t('devise.failure.invalid')
  end
end
