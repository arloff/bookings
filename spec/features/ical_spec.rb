# frozen_string_literal: true

require 'rails_helper'

describe 'ical support', type: :feature do
  before :each do
    @b1 = create(:booking)
    @b2 = create(:booking2)
    visit ical_path
  end
  it 'shows initials' do
    [@b1, @b2].each do |booking|
      expect(page).to have_content(booking.person.initials)
    end
  end
  it 'shows start time' do
    [@b1, @b2].each do |booking|
      expect(page).to have_content(booking.date_in.strftime('%Y%m%dT%H%M%S'))
    end
  end
end

# BEGIN:VEVENT
# DTSTAMP:20180820T165309Z
# UID:991ed94d-ac85-47a4-85a4-9c2d6020dc93
# DTSTART;TZID=Europe/Berlin:
# DTEND;TZID=Europe/Berlin:20190122T000000
# SUMMARY:Arendt
# END:VEVENT
