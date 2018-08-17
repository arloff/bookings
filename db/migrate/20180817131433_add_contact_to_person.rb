class AddContactToPerson < ActiveRecord::Migration[5.2]
  def change
    add_reference :people, :contact, foreign_key: true
  end
end
