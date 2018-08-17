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

describe 'creating a booking', type: :feature do
  before :each do
    @booking = create(:booking)
  end
  context 'creates a booking' do
    it 'successfully' do
      create_booking(@booking)
      expect(page).to have_content t('activerecord.successful.messages.created',
                                     model: Booking.model_name.human)
    end

    it 'with correct booking data' do
      create_booking(@booking)
      check_for_booking_data(@booking)
    end

    it 'with correct person data' do
      create_booking(@booking)
      check_for_data(@booking.person)
    end

    it 'with correct contact data' do
      create_booking(@booking)
      check_for_data(@booking.contact)
    end
  end
end
