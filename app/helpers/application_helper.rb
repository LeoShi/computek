module ApplicationHelper
  def role_list
    case current_user.role
      when "admin"
       return User::ROLES
      when "captain"
       return [User::ROLES.last]
      else
       return []
    end
  end
end
