# frozen_string_literal: true

require 'rails_helper'
require_relative './support/helpers.rb'

def check_for_booking_data(booking)
  expect_page_to_have_label_content_pairs(
    [['activerecord.attributes.booking.date_in', format_date(booking.date_in)],
     ['activerecord.attributes.booking.date_out', format_date(booking.date_out)],
     ['activerecord.attributes.booking.comment', booking.comment],
     ['activerecord.attributes.booking.no_persons', booking.no_persons]]
  )
end

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
