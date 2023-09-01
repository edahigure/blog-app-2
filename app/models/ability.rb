class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Post
    can :read, Comment

    return unless user.present? # additional permissions for logged in users (they can read their own posts)

    can %i[read update create destroy], Post, author_id: user.id
    can %i[read update create destroy], Comment, author_id: user.id

    return unless user.admin? # additional permissions for administrators

    can :manage, :all
  end
end
