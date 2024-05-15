class ApplicationController < ActionController::Base
	include Pundit
	before_action :setup_nav
	require 'ice_cube'
  require 'active_support/time'

	def setup_nav
		@sections = Section.where(visible: true, location: ["Main Nav", "Main Nav & Footer"]).sort_by {|s| s.position}
		@perms = permDecider()
		@footer_sections = Section.where(visible: true, location: ["Footer", "Main Nav & Footer"]).sort_by {|s| s.position}
	end

	def permDecider
    @perms=false
    if user_signed_in?
      current_user.roles.each do |r|
        r.permissions.each do |p|
				  #If the user has access to a permission and it's NOT the pages model they're allowed to see the control panel
	        if p.canRead && p.permissible_type != "Page" 
					  return true
					#If the user has access to a permission that can read and applies to all records and it IS the pages model they can see the control panel if they can edit, delete, or update the model as well 
			  	elsif (p.canRead && p.permissible_type == "Page")
			  		#If the user can create pages, delete pages, update pages, they can see the control panel. Otherwise they can't see the control panel.
					  if p.canCreate || p.canDelete || p.canUpdate
						  return true
					  else
					    return false
					  end
				  #If the user has access to a permission that they can read and isn't a basic page they're allowed to see the control panel 
				  elsif p.canRead && Page.find(p.permissible_id).page_type != "Basic Page"
				    return true
				  end
        end
      end
    end
    return false
	end

	rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

	private

	def user_not_authorized
		flash[:alert] = "You are not authorized to perform this action."	
		redirect_to(request.referrer || root_path)
	end
	
end