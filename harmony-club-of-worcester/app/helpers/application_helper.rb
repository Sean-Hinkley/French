module ApplicationHelper
  def canCreateEvent
    if current_user
      current_user.roles.each do |r|
        r.permissions.each do |p|
          if p.permissible_type == "Event"
            if p.canCreate
              return true
            end
          end
        end
      end
    end
    return false
  end
end
