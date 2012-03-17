class Ability
  include CanCan::Ability

  def initialize(user)
    alias_action :view, to: :read

    can :new, UserSession if user.blank?
    can :destroy, UserSession if user.present?
    can :create, ProposedName
    can :read, Group
    can :read, Problem, published: true

    # Admin permissions
    if user.present? 
      can :create, Group
      can :manage, Group, user_id: user.id

      if user.admin?
        can :manage, Post
        can :manage, Page
        can :manage, User
        can :manage, Comment
        can :manage, ProposedName
        can :manage, MediaItem
        can :manage, Vote
        can :manage, Phase
        can :manage, Group
        can :manage, Problem
      end
    end


  end
end
