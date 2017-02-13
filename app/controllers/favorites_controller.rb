class FavoritesController < ApplicationController
  before_filter :authenticate_user!

  def index
    @user = User.find(current_user)
  end

  def show
  end

  def create
    @favorite = Favorite.favorite_already_added?(current_user, params[:favorite][:favoritee_id])
    if @favorite
      flash[:success] = "That user is already one of your favorites"
      redirect_to users_path
    else
      @favorite = Favorite.new(favorite_params)
      if @favorite.save
        flash[:success] = "Updated favorites"
        redirect_to users_path
      else
        flash[:danger] = "Unable to update favorites"
        redirect_to users_path
      end
    end
  end

  def update
  end

  def destroy
  end

  private
    def favorite_params
      params.require(:favorite).permit(:favoritee_id).merge(favoriter_id: current_user.id)
    end
end
