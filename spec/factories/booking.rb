# frozen_string_literal: true

FactoryBot.define do
  factory :booking do
    date_in { Date.today }
    date_out { Date.today + 1.week }
    association :contact, factory: :contact
  end
end
