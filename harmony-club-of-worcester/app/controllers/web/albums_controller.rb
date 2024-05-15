class Web::AlbumsController < ApplicationController
  
  def index
    @albums = Album.all - Album.where(title: "«Temp Album»")
    if @albums.any?
      @noAlbums = false
    else
      @noAlbums = true
    end
  end

  def show
    @photo = Photo.find(params[:id])
  end
end
