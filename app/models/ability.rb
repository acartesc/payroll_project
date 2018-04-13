class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
<<<<<<< HEAD
      if user.role == 'admin'
=======
      if user.admin?
>>>>>>> master
        can :manage, :all
      else
        can :read, :all
      end
    end
end
