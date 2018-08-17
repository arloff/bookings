# frozen_string_literal: true

require 'rails_helper'
def create_booking(booking)
  visit new_booking_path(locale: :de)

  fill_in_booking(booking)
  fill_in_person(booking.person)
  fill_in_contact(booking.contact)

  click_button 'Buchungsanfrage erstellen'
end

def text_re(one, two)
  Regexp.new("#{one}.*#{two}")
end

def expect_page_to_have_label_content_pair(label, content)
  expect(page).to have_content(text_re(t(label), content))
end

def expect_page_to_have_label_content_pairs(list)
  list.each do |label, content|
    expect_page_to_have_label_content_pair(label, content)
  end
end

def fill_in_booking(booking)
  within('#booking-form') do
    select_date(booking.date_in,
                from: t('activerecord.attributes.booking.date_in'))
    select_date(booking.date_out,
                from: t('activerecord.attributes.booking.date_out'))
    fill_in t('activerecord.attributes.booking.no_persons'),
            with: booking.no_persons
  end
  within('#booking-form-comment') do
    fill_in t('activerecord.attributes.booking.comment'),
            with: booking.comment
  end
end

def check_for_booking_data(booking)
  expect_page_to_have_label_content_pairs(
    [['activerecord.attributes.booking.date_in', format_date(booking.date_in)],
     ['activerecord.attributes.booking.date_out', format_date(booking.date_out)],
     ['activerecord.attributes.booking.comment', booking.comment],
     ['activerecord.attributes.booking.no_persons', booking.no_persons]]
  )
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

def check_for_person_data(person)
  expect_page_to_have_label_content_pairs(
    [['activerecord.attributes.person.first_name', person.first_name],
     ['activerecord.attributes.person.last_name', person.last_name],
     ['activerecord.attributes.person.salutation', person.salutation]]
  )
end

def fill_in_contact(contact)
  within('#contact-form') do
    fill_in t('activerecord.attributes.contact.email'),
            with: contact.email
    fill_in t('activerecord.attributes.contact.street'),
            with: contact.street
    fill_in t('activerecord.attributes.contact.city'),
            with: contact.city
    fill_in t('activerecord.attributes.contact.postalCode'),
            with: contact.postalCode
    fill_in t('activerecord.attributes.contact.phone'),
            with: contact.phone
  end
end

def check_for_contact_data(contact)
  expect_page_to_have_label_content_pairs(
    [['activerecord.attributes.contact.email', contact.email],
     ['activerecord.attributes.contact.street', contact.street],
     ['activerecord.attributes.contact.postalCode', contact.postalCode],
     ['activerecord.attributes.contact.city', contact.city],
     ['activerecord.attributes.contact.phone', contact.phone]]
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
      check_for_person_data(@booking.person)
    end

    it 'with correct contact data' do
      create_booking(@booking)
      check_for_contact_data(@booking.contact)
    end
  end
end
