# frozen_string_literal: true

# Creates the initial Bookings table.
class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.datetime :date_in
      t.datetime :date_out
      t.string :status
      t.references :contact, index: true
      t.integer :no_persons
      t.text :comment
      t.timestamps
    end
  end
end
