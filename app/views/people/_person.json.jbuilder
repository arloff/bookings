# frozen_string_literal: true

json.extract! person, :id, :first_name, :last_name, :salutation, :created_at, :updated_at
json.url person_url(person, format: :json)
