# frozen_string_literal: true

require 'rails_helper'
require_relative './support/helpers.rb'

describe 'updating a booking', type: :feature do
  before :each do
    @booking = create(:booking)
    create_booking(@booking)
    @booking2 = create(:booking2)
  end
  it '- changes booking data' do
    visit edit_booking_path(@booking, locale: :de)
    fill_in_booking(@booking2)
    click_button t('helpers.submit.update', model: Booking.model_name.human)
    check_for_booking_data(@booking2)
  end

  it 'changes person data' do
    visit edit_booking_path(@booking, locale: :de)
    fill_in_data(@booking2.person)
    click_button t('helpers.submit.update', model: Booking.model_name.human)
    check_for_data(@booking2.person)
  end

  it 'changes contact data' do
    visit edit_booking_path(@booking, locale: :de)
    fill_in_data(@booking2.contact)
    click_button t('helpers.submit.update', model: Booking.model_name.human)
    check_for_data(@booking2.contact)
  end
end
