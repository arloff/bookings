# frozen_string_literal: true

# Controller for the Calendar Views
class CalendarController < ApplicationController
  skip_before_action :authenticate_user!, only: [:ical]
  before_action :set_bookings

  include CalendarHelper
  def ical
    cal = fill_calendar(@bookings)
    render plain: cal.to_ical
  end

  def calendar
  end

  private

  def set_bookings
    @bookings = Booking.all
  end
end
