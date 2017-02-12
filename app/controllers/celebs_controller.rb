class CelebsController < ApplicationController
   before_filter :authenticate_user!
  
  def index
  	# celebs infinite scroll
  end

  def show
  	# @profile = CelebProfile.new(celeb_params) -?
   	# celeb.profile pic
    # celeb.basic info
    # celeb.chart Vedic
    # celeb.chart Western
    # celeb.chart astrologer view
    # celeb.details
    # celeb.interaction buttons - ?
    # celeb.uploaded pics - not yet 
  end
end