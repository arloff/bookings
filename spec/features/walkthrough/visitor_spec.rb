# frozen_string_literal: true

require 'rails_helper'

describe 'visitor experience', type: :feature do
  before :each do
    @b1 = create(:booking)
    @b2 = create(:booking2)
  end
  it 'shows welcome' do
    visit root_path
    expect(page).to have_content t('welcome.welcome')
  end
end
