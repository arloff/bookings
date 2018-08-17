# frozen_string_literal: true

# This will guess the User class
FactoryBot.define do
  factory :person do
    first_name 'John'
    last_name  'Doe'
  end

  # This will use the User class (Admin would have been guessed)
  factory :person2, class: Person do
    first_name 'Jane'
    last_name  'Doe'
  end
end
