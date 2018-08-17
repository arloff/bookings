# frozen_string_literal: true

# Represents a Contact for a Booking
class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.string :street
      t.string :city
      t.string :postalCode
      t.string :phone
      t.string :email

      t.timestamps
    end
  end
end
