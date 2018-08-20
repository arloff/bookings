class CalendarController < ApplicationController
  skip_before_action :authenticate_user!, only: [:ical]

  include CalendarHelper
  def ical
    cal = fill_calendar(Booking.all)
    render plain: cal.to_ical
  end
end
