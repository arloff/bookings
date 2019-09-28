# frozen_string_literal: true

if Rails.env.development?
  User.create(email: 'admin@test.de',
              password: 'geheim12',
              password_confirmation: 'geheim12',
              role: :admin)
  User.create(email: 'staff@test.de',
              password: 'geheim12',
              password_confirmation: 'geheim12',
              role: :staff)
  User.create(email: 'guest@test.de',
              password: 'geheim12',
              password_confirmation: 'geheim12',
              role: :guest)
  User.create(email: 'user@test.de',
              password: 'geheim12',
              password_confirmation: 'geheim12')



c = Contact.create(street: "Unter den Linden 1", city: "Berlin", postalCode: 10000, email: "asdf@asdf.de")
p = c.persons.create(first_name: "Dagobert", last_name: "Duck", salutation: "Ente")
c.bookings.create(date_in: Date.new(2019,04,01), date_out: Date.new(2019,04,15), no_persons: 3)

c = Contact.create(street: "Friedrichstr. 123", city: "Berlin", postalCode: 12345, email: "dde@fwewe.de")
p = c.persons.create(first_name: "Trick", last_name: "Duck", salutation: "Ente")
c.bookings.create(date_in: Date.new(2019,05,12), date_out: Date.new(2019,05,18), no_persons: 3)

end
