# frozen_string_literal: true

class AddContactToBooking < ActiveRecord::Migration[5.2]
  def change
    add_reference :bookings, :contact, foreign_key: true
    add_column :bookings, :persons, :integer
    add_column :bookings, :comment, :text
  end
end
