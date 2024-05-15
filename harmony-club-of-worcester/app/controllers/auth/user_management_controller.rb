class Auth::UserManagementController < ApplicationController
  #before_action  :authenticate_user!
  
  def index
    @users = User.all
    #authorize self

    if request.delete?
      User.find(params[:id]).destroy
    end
  end

  def show
    #authorize self
    @user = User.find(params[:id])
    @roles = Role.all

    if params[:roleName]
      if params[:roleValue] == "true"
        @user.roles.append(Role.where(title: params[:roleName].titleize))
      else
        @user.roles.delete(Role.where(title: params[:roleName].titleize))
      end
    end
  end

  def new
    if request.post?
      User.create_new_user(params[:email], params[:password])
      redirect_to auth_user_management_index_path
    end
  end
end
