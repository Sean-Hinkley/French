class Auth::UserManagementControllerPolicy < ApplicationPolicy
    def index?
        user.roles.each do |role|
            if role.title == "Administrator" || role.title == "Developer"
                return true
            end
        end

        return false
    end

    def show?
        index?
    end
end