class Auth::SiteControllerPolicy < ApplicationPolicy
    def panel?
        user.roles.each do |role|
            role.permissions.each do |permission|
                if permission.canRead
                    return true
                end
            end
        end

        return false
    end

    def page?
      user.roles.each do |role|
        role.permissions.each do |permission|
            if (permission.permissible_id == record.id || permission.allRecords) && permission.permissible_type == "Page" && permission.canRead
            return true
            end
        end
        end
        
        return false
    end
end