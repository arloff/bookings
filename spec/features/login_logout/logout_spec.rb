# frozen_string_literal: true

require 'rails_helper'

describe 'logout', type: :feature do
  context 'when logged in' do
    before :each do
      user = FactoryBot.create(:admin)
      login_as(user, scope: :user)
    end
    it 'logs user out' do
      visit root_path
      click_on t('devise.login.sign_out')
      expect(page).to have_content(t('devise.sessions.sign_in'))
    end
  end
end
