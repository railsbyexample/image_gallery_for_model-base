##
# Defines permissions for a given user
class Ability
  include CanCan::Ability

  def initialize(user)
  end
end
