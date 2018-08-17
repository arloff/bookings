# frozen_string_literal: true

# Time Markes for Booking dokumenting the Booking's State.
class CreateMarkers < ActiveRecord::Migration[5.2]
  def change
    create_table :markers do |t|
      t.string :name
      t.datetime :time_stamp
      t.references :booking, index: true

      t.timestamps

      # :requested
      # :confirmed
      # :contract_signed
      # :deposit_payed
      # :payed
    end
  end
end
