class UsersController < ApplicationController
			
	def index
		@users = User.all_except(current_user)
	end     
  
  def show
    @user = User.find(params[:id])
    @current_user = current_user

    # profile facade? - @profile = Profile.new(current_user)
  	
  	# user.profile pic - paperclip or carrierwave
    # user.basic info
    # user.chart Vedic
    # user.chart Western
    # user.chart astrologer view
    # user.user details
    # user.uploaded pics - not yet
    # interaction buttons - partial view rendered if user != current_user
  end

	def edit
		# if current_user
      # profile pic cropper
      # basic info
      # user details
      # birth info
	end 

  def update
  end

end