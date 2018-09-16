# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database
# with its default values.
# The data can then be loaded with the rails db:seed command (or created
# alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' },
#  { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

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
end
