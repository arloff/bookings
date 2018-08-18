# frozen_string_literal: true

# Represents a User, controlled by devise.
FactoryBot.define do
  factory :user do
    email { 'test@example.com' }
    password { 'f4k3p455w0rd' }
    role { 'guest' }
  end

  factory :admin, class: User do
    email { 'admin@example.com' }
    password { 'f4k3p455w0rd' }
    role { 'admin' }
  end

  factory :staff, class: User do
    email { 'staff@example.com' }
    password { 'f4k3p455w0rd' }
    role { 'staff' }
  end
end
