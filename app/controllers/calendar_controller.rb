# frozen_string_literal: true

# Controller for the Calendar Views
class CalendarController < ApplicationController
  skip_before_action :authenticate_user!, only: [:ical]
  before_action :set_bookings

  include CalendarHelper

  def ical
    authorize! :anonymous_list, Booking
    cal = fill_calendar(@bookings)
    render plain: cal.to_ical
  end

  def calendar
    authorize! :anonymous_list, Booking
    authorize! :list, Booking
  end

  private

  def set_bookings
    @bookings = Booking.all
  end
end
