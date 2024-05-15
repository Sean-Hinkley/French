class AuthorizationPolicy < ApplicationPolicy

    def isDeveloper?
        user.roles.include?(Role.find_by_title("Developer"))
    end 

    def index?
        if isDeveloper? 
            return true
        end
        user.roles.each do |role|
            role.permissions.each do |permission|
                @temp = nil
                if (permission.permissible_id || permission.allRecords) && permission.permissible_type.constantize == record.first().class && permission.canRead
                    return true
                end
            end
        end

        return false
    end
    def show?
        if isDeveloper? 
            return true
        end
        user.roles.each do |role|
            role.permissions.each do |permission|
                if (permission.permissible_id == record.id || permission.allRecords) && permission.permissible_type.constantize == @record.class && permission.canRead
                    return true
                end
            end
        end
        
        return false
    end
    
    def new?
        if isDeveloper? 
            return true
        end
        user.roles.each do |role|
            role.permissions.each do |permission|
                if (permission.permissible_id == record.id || permission.allRecords) && permission.permissible_type.constantize == @record.class && permission.canRead
                    return true
                end  
            end  
        end
        
        return false
    end
    
    def edit?
        if isDeveloper? 
            return true
        end
        user.roles.each do |role|
            role.permissions.each do |permission|
                if (permission.permissible_id == record.id || permission.allRecords) && permission.permissible_type.constantize == @record.class && permission.canUpdate
                    return true
                end
            end
        end
        
        return false
    end
    
    def destroy?
        if isDeveloper? 
            return true
        end
        user.roles.each do |role|
            role.permissions.each do |permission|
                if (permission.permissible_id == record.id || permission.allRecords) && permission.permissible_type.constantize == @record.class && permission.canDelete
                    return true
                end  
            end
        end
        
        return false
    end
end