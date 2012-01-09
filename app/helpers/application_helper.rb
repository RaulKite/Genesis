module ApplicationHelper
  def render_title
    return @title if defined?(@title)
    "Genesis"
  end
  
  def user_has_role?(role)
    @user.roles.include?(role)
  end
  
end
