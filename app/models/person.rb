# frozen_string_literal: true

# Represents a Person.
class Person < ApplicationRecord
  belongs_to :contact
  has_many :bookings, through: :contact
  validates :last_name, presence: true
  def initials
    "#{first_name.first}#{last_name.first}"
  end
end
