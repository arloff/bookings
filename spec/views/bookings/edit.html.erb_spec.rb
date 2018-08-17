# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'bookings/edit', type: :view do
  before(:each) do
    @booking = assign(:booking, Booking.create!(
                                  status: 'MyString'
                                ))
  end

  it 'renders the edit booking form' do
    render

    assert_select 'form[action=?][method=?]', booking_path(@booking), 'post' do
      assert_select 'input[name=?]', 'booking[status]'
    end
  end
end
