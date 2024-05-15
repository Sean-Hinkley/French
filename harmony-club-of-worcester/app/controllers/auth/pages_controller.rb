class Auth::PagesController < ApplicationController
  before_action :set_page, only: %i[ show edit update destroy ]
  before_action  :authenticate_user!

  # GET /pages or /pages.json
  def index
    @auth_sections = Section.joins(:pages).group('sections.id').having('count(section_id) > 0').all.sort_by{|s| s.position}.sort_by{|s| s.visible ? 0 : 1 } - Section.where(title: "«Temp Section»")    
    #@auth_sections.each do |section|
      #if !section.pages.any?
        #@auth_sections = @auth_sections - section
      #end
    #end
    authorize Page.all, policy_class: AuthorizationPolicy
  end

  # GET /pages/1 or /pages/1.json
  def show
    authorize @page, policy_class: AuthorizationPolicy
  end

  # GET /pages/new
  def new
    @page = Page.new(:visible => true)
    
    authorize @page, policy_class: AuthorizationPolicy
    #put function
  end

  # GET /pages/1/edit
  def edit
    authorize @page, policy_class: AuthorizationPolicy
  end

  # POST /pages or /pages.json
  def create
    @page = Page.new(page_params)

    if @page.visible && !@page.section.visible
      @page.visible = @page.section.visible
    end

    respond_to do |format|
      if @page.save
        format.html { redirect_to auth_page_path(@page), notice: "Page was successfully created." }
        format.json { render :show, status: :created, location: @page }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pages/1 or /pages/1.json
  def update
    respond_to do |format|
      if @page.update(page_params)
        if @page.visible && !@page.section.visible
          @page.update(visible: @page.section.visible)
        end

        format.html { redirect_to auth_page_path(@page), notice: "Page was successfully updated." }
        format.json { render :show, status: :ok, location: @page }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pages/1 or /pages/1.json
  def destroy
    authorize @page, policy_class: AuthorizationPolicy

    Permission.all.each do |permission|
      if permission.permissible_type == "Page" && permission.permissible_id == @page.id
        permission.destroy
      end
    end
    if @page.page_type != "Internal URL"
      @page.destroy
      respond_to do |format|
        format.html { redirect_to auth_pages_url, notice: "Page was successfully destroyed." }
        format.json { head :no_content }
      end
    else
      redirect_to auth_pages_url, alert: "That page is a unique page and can't be deleted!" 
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_page
      @page = Page.friendly.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def page_params
      params.require(:page).permit(:title, :section_id, :page_type, :permalink, :visible, :position, :content, :destination, :authenticate, :doc)
    end
end
