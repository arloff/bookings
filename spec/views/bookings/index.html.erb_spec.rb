# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'bookings/index', type: :view do
  before(:each) do
    assign(:bookings, [
             Booking.create!(
               status: 'Status'
             ),
             Booking.create!(
               status: 'Status'
             )
           ])
  end

  it 'renders a list of bookings' do
    render
    assert_select 'tr>td', text: 'Status'.to_s, count: 2
  end
end
