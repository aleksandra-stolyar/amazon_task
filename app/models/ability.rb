class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new                          # guest user 
    
    alias_action :create, :read, :update, :destroy, :to => :crud
    alias_action :approve_review, :cancel_review, :to => :manage_reviews
      if user.role?(:admin)
        # can :manage, :all
        can :access, :rails_admin # needed to access RailsAdmin
        can :dashboard
        # (crud) books, authors, categories, (read/change state) orders
        # ('in_progress', 'in_delivery', 'delivered', 'in_queue', 'canceled'),
        # (approve/reject) reviews
        can :crud, Book
        can :crud, Author
        can :crud, Category
        can [:read, :update], Order
        can :read, Rating
        can :update, Rating
        can :manage_reviews, Rating
      elsif user.role?(:customer)
        can :read, :all
        can :create, Rating
        can :update, Rating 
      else
        can :read, :all           
      end
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
