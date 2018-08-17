# frozen_string_literal: true

FactoryBot.define do
  factory :booking do
    date_in { Date.today }
    date_out { Date.today + 1.week }
    association :contact, factory: :contact
  end
  factory :booking2, class: Booking do
    date_in { Date.tomorrow }
    date_out { Date.today + 2.week }
    association :contact, factory: :contact2
  end
end
