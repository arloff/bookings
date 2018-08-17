# frozen_string_literal: true

require 'rails_helper'

def fill_in_booking(booking)
  within('#booking-form') do
    select_date(booking.date_in,
                from: t('activerecord.attributes.booking.date_in'))
    select_date(booking.date_out,
                from: t('activerecord.attributes.booking.date_out'))
  end
end

def check_for_booking_data(booking)
    date_in = Regexp.new("#{t('activerecord.attributes.booking.date_in')}.*#{format_date(booking.date_in)}")

  expect(page).to have_content(date_in)
end

def fill_in_person(person)
  within('#person-form') do
    fill_in t('activerecord.attributes.person.first_name'),
            with: person.first_name
    fill_in t('activerecord.attributes.person.last_name'),
            with: person.last_name
    fill_in t('activerecord.attributes.person.salutation'),
            with: person.salutation
  end
end

def fill_in_contact(contact)
  within('#contact-form') do
    fill_in t('activerecord.attributes.contact.email'),
            with: contact.email
    fill_in t('activerecord.attributes.contact.city'),
            with: contact.city
    fill_in t('activerecord.attributes.contact.postalCode'),
            with: contact.postalCode
  end
end

describe 'creating a booking', type: :feature do
  before :each do
    @booking = create(:booking)
  end
  context 'creates a booking' do
    it 'successfully' do
      visit new_booking_path(locale: :de)

      fill_in_booking(@booking)
      fill_in_person(@booking.person)
      fill_in_contact(@booking.contact)

      click_button 'Buchungsanfrage erstellen'
      expect(page).to have_content t('activerecord.successful.messages.created',
                                     model: Booking.model_name.human)
    end
    it 'with correct booking data' do
      visit new_booking_path(locale: :de)

      fill_in_booking(@booking)
      fill_in_person(@booking.person)
      fill_in_contact(@booking.contact)

      click_button 'Buchungsanfrage erstellen'
      expect(page).to have_content t('activerecord.successful.messages.created',
                                     model: Booking.model_name.human)
      check_for_booking_data(@booking)
    end
  end
end
