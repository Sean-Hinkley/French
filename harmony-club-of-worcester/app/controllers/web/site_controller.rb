class Web::SiteController < ApplicationController
  
  def home
    
  end
  def pdf
    @page = Page.friendly.find(params[:id])
  end
  def page
    @page = Page.friendly.find(params[:id])
  end
end