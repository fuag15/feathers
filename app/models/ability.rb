# This class controls who can or can not manage models or read which routes
# on a failure it throws a CanCan::Access Denied which is handled by the ApplicationController
class Ability
  # include the module from can cans libs
  include CanCan::Ability

  # if a user is signed in use the signed in user else
  # create a new user with default params
  def initialize user
    user ||= User.new
    if user.admin?
        can :manage, :all
    else
        can :read, :all
    end
  end
end
