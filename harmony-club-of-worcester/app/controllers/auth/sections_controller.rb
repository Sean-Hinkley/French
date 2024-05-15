class Auth::SectionsController < ApplicationController
  before_action :set_section, only: %i[ show edit update destroy ]
  before_action  :authenticate_user!

  # GET /sections or /sections.json
  def index
    @user=current_user
    @auth_sections = Section.all.sort_by{|s| s.position}.sort_by{|s| s.visible ? 0 : 1 } - Section.where(title: "«Temp Section»")
    authorize Section.all, policy_class: AuthorizationPolicy
  end

  # GET /sections/1 or /sections/1.json
  def show
    authorize @section, policy_class: AuthorizationPolicy
  end

  # GET /sections/new
  def new
    @section = Section.new(:visible => true)
    
    authorize @section, policy_class: AuthorizationPolicy
  end

  # GET /sections/1/edit
  def edit
    authorize @section, policy_class: AuthorizationPolicy
  end

  # POST /sections or /sections.json
  def create
    @section = Section.new(section_params)
    respond_to do |format|
      if @section.save
        format.html { redirect_to auth_section_path(@section), notice: "Section was successfully created." }
        format.json { render :show, status: :created, location: @section }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @section.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sections/1 or /sections/1.json
  def update
    respond_to do |format|
      if @section.update(section_params)
        @section.pages.each do |page|
          if page.visible && !@section.visible
            page.update(visible: @section.visible)
          end
        end
        format.html { redirect_to auth_section_path(@section), notice: "Section was successfully updated." }
        format.json { render :show, status: :ok, location: @section }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @section.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sections/1 or /sections/1.json
  def destroy
    authorize @section, policy_class: AuthorizationPolicy
    @foundInternal = false
    @section.pages.each do |p|
      if p.page_type == "Internal URL"
        @foundInternal = true
        @foundInternalName = p.title
      end
    end

    if @foundInternal
      redirect_to auth_sections_url, alert: "This section has a unique page called " + @foundInternalName + " that can't be deleted! Please move the unique page to another section!"
    else
      @section.pages.each do |p|
        p.destroy
      end
      Permission.all.each do |permission|
        if permission.permissible_type == "Section" && permission.permissible_id == @section.id
          permission.destroy
        end
      end

      @section.destroy
      respond_to do |format|
        format.html { redirect_to auth_sections_url, notice: "Section was successfully destroyed." }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_section
      @section = Section.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def section_params
      params.require(:section).permit(:location, :title, :visible, :position)
    end
end