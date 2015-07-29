class AdminAbility
  include CanCan::Ability

  def initialize(admin)
    can :access, :rails_admin   # grant access to rails_admin
    can :dashboard              # grant access to the dashboard

  end
end
