class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.datetime :date_in
      t.datetime :date_out
      t.string :status
      t.datetime :requested
      t.datetime :confirmed
      t.datetime :contract_signed
      t.datetime :deposit_payed
      t.datetime :payed

      t.timestamps
    end
  end
end
