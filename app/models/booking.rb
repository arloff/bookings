# frozen_string_literal: true

# Represents a Booking with a Time Period.
class Booking < ApplicationRecord
  has_one :contact
  has_many :persons, through: contact
  accepts_nested_attributes_for :contact, :persons
end
