# frozen_string_literal: true

# Represents a Person.
class Person < ApplicationRecord
  has_one :contact
  has_many :bookings, through: contact
end
