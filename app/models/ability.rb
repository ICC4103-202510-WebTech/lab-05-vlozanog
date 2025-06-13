class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user.present?

    if user.admin?
      can :read, User
    end

    can :read, :all
    can :read, Chat, sender_id: user.id
    can :read, Chat, receiver_id: user.id
    can [:edit, :update], Chat, sender_id: user.id
    can [:edit, :update], Chat, receiver_id: user.id
    can :create, Chat
    can :create, Message
    can [:update, :destroy], Message, user_id: user.id
  end
end