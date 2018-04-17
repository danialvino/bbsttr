class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
      user ||= User.new # guest user (not logged in)
      if user.sitter?
        can :manage, Sitter, user_id: user.id
        can :manage, Available
        can :read, Booking, sitter_id: user.sitter.id
        can :update, Booking, sitter_id: user.sitter.id
        can :manage, Reviewsparent, sitter_id: user.sitter.id
        can :read, Reviewssitter
        can :read, Favorite
        can :manage, BankInfo, sitter_id: user.sitter.id
        can :read, Child
      elsif user.sitter? == false
        can :read, Sitter
        can :new, Sitter
        can :create, Sitter
        can :new, BankInfo
        can :create, BankInfo
        can :read, Reviewsparent
        can :manage, Favorite
        can :manage, Reviewssitter, user_id: user.id
        can :manage, Child, user_id: user.id
        can :manage, Booking, user_id: user.id
      else
        can :read, :all
      end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
