class UsersController < ApplicationController
	before_action :set_current_user, only: [:show, :edit]

	def index
		@users = User.all_except(current_user)
	end     
  
  def show
    if params[:id] != current_user.id
      @user = User.find(params[:id])
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
	end 

  def update
    if @current_user.update(user_params)
      flash[:success] = "Profile updated!"
      redirect_to user_path(current_user.id)
    else
      flash[:danger] = "Uh oh, we were unable to updated your profile!"
      redirect_to edit_user_path(current_user.id)
    end
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

  def nearby 
    @distance = params[:distance]
    respond_to do |format|
      format.js
    end
  end

  private

  def user_params
    params.require(:user).permit(:location, :avatar)
  end

end