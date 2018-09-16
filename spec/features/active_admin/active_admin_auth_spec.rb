# frozen_string_literal: true

require 'rails_helper'
require_relative '../support/helpers.rb'

describe 'active admin', type: :feature do
  before :each do
    @dashboard_text =  t('active_admin.dashboard_welcome.welcome')
  end
  context 'not logged in at all' do
    it 'dashboard is not shown' do
      visit admin_root_path(locale: :de)
      expect(page).not_to have_content(@dashboard_text)
    end
  end

  context 'logged in as guest' do
    before :each do
      user = FactoryBot.create(:guest)
      login_as(user)
    end
    it 'dashboard is shown' do
      visit admin_root_path(locale: :de)
      expect(page).not_to have_content(@dashboard_text)
    end
  end

  context 'logged in as admin' do
    before :each do
      @user = user = FactoryBot.create(:admin)
      login_as(user)
    end
    it 'dashboard is shown' do
      visit admin_root_path(locale: :de)
      expect(page).to have_content(@dashboard_text)
    end
  end
end
