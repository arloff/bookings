# frozen_string_literal: true

# https://github.com/CanCanCommunity/cancancan
class Ability
  include CanCan::Ability

  def initialize(user)
    can :anonymous_list, Booking

    return unless user.present?

    return unless user.guest? || user.staff? || user.admin?

    can :read, User, id: user.id
    can :read, Booking, user_id: user.id

    return unless user.staff? || user.admin?

    can :index, Booking

    return unless user.admin?

    can :manage, :all
  end
end
