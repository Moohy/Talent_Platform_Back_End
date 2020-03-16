# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    alias_action :read, :update, to: :ru
    alias_action :create, :read, :update, to: :cru
      user ||= User.new # guest user (not logged in)
      if user.role? "admin"
        can :manage, :all
      elsif user.role? 'seller'
        can :manage, Service, user_id: user.id
        can :manage, Gallery, service:{user:{id: user.id}}
        can [:read, :accept, :decline], Offer, service: {user: {id: user.id}} #func for editing
        can :read, Category
        # can :read, Rate
        can :read, Payment, offer: {service: {user_id: user.id}}
        can :ru, Profile, user_id: user.id
        can :read, Profile
        can :create, :update, Bank
      elsif user.role? 'buyer'
        can :read, Service
        can [:cru, :decline], Offer, user_id: user.id
        can [:create, :read], Payment, offer: {user_id: user.id}
        can :read, Category
        can :read, Gallery
        # can :cru, Rate
        can :ru, Profile, user_id: user.id
        can :read, Profile
        can :read, Bank
      else
        can :read, Service
        can :read, Category
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
