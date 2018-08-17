# frozen_string_literal: true

require 'rails_helper'

def select_date(date, options = {})
  field = options[:from]
  base_id = find(:xpath, ".//label[contains(.,'#{field}')]")[:for]
  day, month_s, year = date.split('.')
  month = I18n. t('date.month_names')[month_s.to_i]
  select year,  from: "#{base_id}_1i"
  select month, from: "#{base_id}_2i"
  select day,   from: "#{base_id}_3i"
end

def select_time(time, options = {})
  hour, minute = time.split(':')
  field = options[:from]
  base_id = find(:xpath, ".//label[contains(.,'#{field}')]")[:for]
  select hour, from: "#{base_id}_4i"
  select minute, from: "#{base_id}_5i"
end

describe 'creating a booking', type: :feature do
  # before :each do
  #  User.make(email: 'user@example.com', password: 'password')
  # end

  it 'creates a booking' do
    visit new_booking_path(locale: :de)
    within('#booking-form') do
      select_date('17.8.2018',
                  from: t('activerecord.attributes.booking.date_in'))
      select_date('24.8.2018',
                  from: t('activerecord.attributes.booking.date_out'))
    end
    within('#person-form') do
      fill_in t('activerecord.attributes.person.first_name'), with: 'Barne'
      fill_in t('activerecord.attributes.person.last_name'), with: 'Kleinen'
      fill_in t('activerecord.attributes.person.salutation'), with: 'Dr.'
    end

    within('#contact-form') do
      fill_in t('activerecord.attributes.contact.email'),
              with: 'kleinen@infrastructure.de'
      fill_in t('activerecord.attributes.contact.city'),
              with: 'Berlin'
      fill_in t('activerecord.attributes.contact.postalCode'),
              with: '12345'
    end
    click_button 'Buchungsanfrage erstellen'
    expect(page).to have_content t('activerecord.successful.messages.created',
                                   model: Booking.model_name.human)
  end
end
