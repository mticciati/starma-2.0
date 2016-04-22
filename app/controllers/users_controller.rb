class UsersController < ApplicationController
			
	def index
		@users = User.all_except(current_user)
	end     
  
  def show
    if params[:id] != current_user.id
      @user = User.find(params[:id])
    else
      @current_user = current_user
    end
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

  def check_username
    if /[a-zA-Z0-9_-]/.match(params[:username])
      user = User.username(params[:username])
      if user.blank?
        render :json => ["free", ":)"]
      else
        render :json => ["taken", "Sorry, username exists!"]
      end
    else
      render :json => ["Letters, numbers, dashes and underscores only please :)"]
    end
  end

end