# frozen_string_literal: true

require 'rails_helper'
require_relative './support/helpers.rb'

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
