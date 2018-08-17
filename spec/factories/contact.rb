# frozen_string_literal: true

FactoryBot.define do
  factory :contact do
    street { 'Unter den Linden 6' }
    postalCode { '12345' }
    city { 'Berlin' }
    phone { '0123456789' }
    email { 'contact@something.com' }
  end
end
