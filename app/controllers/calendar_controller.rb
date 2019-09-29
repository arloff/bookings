# frozen_string_literal: true

# Controller for the Calendar Views
class CalendarController < ApplicationController
  skip_before_action :authenticate_user!, only: [:ical]
  before_action :set_bookings
  before_action :set_booking_dates, only: [:calendar]


  include CalendarHelper

  def ical
    authorize! :anonymous_list, Booking
    cal = fill_calendar(@bookings)
    render plain: cal.to_ical
  end

  def calendar
    authorize! :anonymous_list, Booking
    authorize! :list, Booking
     bookings = Booking.pluck(:date_in, :date_out).map do |a,b|
      "{sy: #{a.year}, sm: #{a.month}, sd: #{a.day}, ey: #{b.year}, em: #{b.month}, ed: #{b.day}}"
    end.join(",")
    @bookings_json = "[#{bookings}]"
# Booking.pluck(:date_in, :date_out).map{ |a,b| {sy: a.year, sm: a.month, sd: a.day, ey: b.year, em: b.month, 'ed' => b.day} }.to_json.gsub(/"/,"'")
  end

  private

  def set_bookings
    @bookings = Booking.all
  end

  def set_booking_dates
    @booking_dates = Booking.pluck(:date_in, :date_out)
  end
end
