##
# Defines permissions for a given user
class Ability
  include CanCan::Ability

  def initialize(user)
    alias_action :create, :read, :update, :destroy, to: :crud

    # All properties are publicly visible
    can :read, Property

    return if user.nil?

    # A user can crud himself
    can :crud, User, id: user
    # A user can crud its own properties
    can :crud, Property, owner_type: user.class.name, owner_id: user.id
    # A user can crud its own properties' images
    can(:crud, Image) { |image| image.owner.owner == user }
  end
end
