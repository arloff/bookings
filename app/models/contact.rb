# frozen_string_literal: true

# Represents the Contact Address for a Booking
class Contact < ApplicationRecord
  has_many :bookings
  has_many :persons
  validates :email, presence: true
end
