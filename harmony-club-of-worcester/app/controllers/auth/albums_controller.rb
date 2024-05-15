class Auth::AlbumsController < ApplicationController
  before_action :set_album, only: %i[ show edit update destroy ]
  before_action  :authenticate_user!

  # GET /albums or /albums.json
  def index
    @albums = Album.all - Album.where(title: "«Temp Album»")
    authorize Album.all, policy_class: AuthorizationPolicy
  end

  # GET /albums/1 or /albums/1.json
  def show
    @album = Album.find(params[:id])
    authorize @album, policy_class: AuthorizationPolicy
  end

  # GET /albums/new
  def new
    @album = Album.new
    authorize @album, policy_class: AuthorizationPolicy
  end

  # GET /albums/1/edit
  def edit
    authorize @album, policy_class: AuthorizationPolicy
  end

  # POST /albums or /albums.json
  def create
    @album = Album.new(album_params)

    respond_to do |format|
      if @album.save
        format.html { redirect_to auth_album_path(@album), notice: "Album was successfully created." }
        format.json { render :show, status: :created, location: @album }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @album.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /albums/1 or /albums/1.json
  def update
    respond_to do |format|
      if @album.update(album_params)
        format.html { redirect_to auth_album_path(@album), notice: "Album was successfully updated." }
        format.json { render :show, status: :ok, location: @album }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @album.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /albums/1 or /albums/1.json
  def destroy
    authorize @album, policy_class: AuthorizationPolicy

    Permission.all.each do |permission|
      if permission.permissible_type == "Album" && permission.permissible_id == @album.id
        permission.destroy
      end
    end

    @album.photos.each do |p|
      p.destroy
    end
    @album.destroy
    respond_to do |format|
      format.html { redirect_to auth_albums_url, notice: "Album was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_album
      @album = Album.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def album_params
      params.require(:album).permit(:title, :description)
    end
end