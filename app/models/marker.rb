# frozen_string_literal: true

# TimeMarkers for the Events in a Booking's life.
class Marker < ApplicationRecord
  belongs_to :booking, dependent: :destroy
end
