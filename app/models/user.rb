# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable
  validates :role, inclusion: { in: %w[admin staff guest],
                                message: '%{value} is not a valid role' }
  def admin?
    role == 'admin'
  end

  def staff?
    (role == 'staff') || (role == 'admin')
  end
end
