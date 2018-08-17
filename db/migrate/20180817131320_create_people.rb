# frozen_string_literal: true

# Represents a Person
class CreatePeople < ActiveRecord::Migration[5.2]
  def change
    create_table :people do |t|
      t.string :first_name
      t.string :last_name
      t.string :salutation
      t.references :contact, index: true

      t.timestamps
    end
  end
end
