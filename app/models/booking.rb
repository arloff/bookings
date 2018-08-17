# frozen_string_literal: true

# Represents a Booking with a Time Period.
class Booking < ApplicationRecord
  belongs_to :contact
  has_many :persons, through: :contact
  has_many :markers
  accepts_nested_attributes_for :contact, :persons
  def person
    persons.first
  end
end
