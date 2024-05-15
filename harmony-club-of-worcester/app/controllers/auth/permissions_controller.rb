class Auth::PermissionsController < ApplicationController
  before_action :set_permission, only: %i[ show edit update destroy ]
  before_action  :authenticate_user!

  # GET /permissions or /permissions.json
  def index
    @permissions = Permission.all - Permission.where(role_id: Role.where(title: "«Temp Role»")[0])
    authorize Permission.all, policy_class: AuthorizationPolicy
  end

  # GET /permissions/1 or /permissions/1.json
  def show
    authorize @permission, policy_class: AuthorizationPolicy
  end

  # GET /permissions/new
  def new
    @permission = Permission.new
    authorize @permission, policy_class: AuthorizationPolicy
  end

  # GET /permissions/1/edit
  def edit
    authorize @permission, policy_class: AuthorizationPolicy
  end

  # POST /permissions or /permissions.json
  def create
    @permission = Permission.new(permission_params)

    respond_to do |format|
      if @permission.save
        format.html { redirect_to auth_permission_path(@permission), notice: "Permission was successfully created." }
        format.json { render :show, status: :created, location: @permission }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @permission.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /permissions/1 or /permissions/1.json
  def update
    respond_to do |format|
      if @permission.update(permission_params)
        format.html { redirect_to auth_permission_path(@permission), notice: "Permission was successfully updated." }
        format.json { render :show, status: :ok, location: @permission }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @permission.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /permissions/1 or /permissions/1.json
  def destroy
    authorize @permission, policy_class: AuthorizationPolicy
    
    @permission.destroy
    respond_to do |format|
      format.html { redirect_to auth_permissions_url, notice: "Permission was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_permission
      @permission = Permission.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def permission_params
      params.require(:permission).permit(:role_id, :permissible_type, :permissible_id, :allRecords, :canCreate, :canUpdate, :canRead, :canDelete)
    end
end
