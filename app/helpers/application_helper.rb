module ApplicationHelper
  def current_auth_resource
    if user.admin?
      current_admin
    else
      current_customer
    end
  end

  def current_ability
      @current_ability or @current_ability = Ability.new(current_auth_resource)
  end

end
