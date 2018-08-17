# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'bookings/new', type: :view do
  before(:each) do
    assign(:booking, Booking.new(
                       status: 'MyString'
                     ))
  end

  it 'renders new booking form' do
    render

    assert_select 'form[action=?][method=?]', bookings_path, 'post' do
      assert_select 'input[name=?]', 'booking[status]'
    end
  end
end
