class Web::SponsorsController < ApplicationController
  def index
    @sponsors = Sponsor.all - Sponsor.where(title: "«Temp Sponsor»")
    if @sponsors.any?
      @noSponsors = false
    else
      @noSponsors = true
    end
  end

  def show
  end
end
