class Ability
    include CanCan::Ability
  
    def initialize(user)
        can :manage, Reservation, user_id: user.id
    end
  end
  