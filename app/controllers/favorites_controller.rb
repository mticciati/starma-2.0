class FavoritesController < ApplicationController
  before_filter :authenticate_user!

  def index
    @user = User.find(current_user)
  end

  def show
  end

  def create
    @favorite = Favorite.new(favorite_params)
    if @favorite.save
      flash[:success] = "Updated favorites"
      redirect_to users_path
    else
      flash[:danger] = "Unable to update favorites"
      redirect_to users_path
    end
  end

  def update
  end

  def destroy
  end

  private
    def favorite_params
      params.permit(:favorite_user_id).merge(user_id: current_user.id)
    end
end
