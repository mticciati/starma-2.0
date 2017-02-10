class FavoritesController < ApplicationController
  before_filter :authenticate_user!

  def index
    @user = User.find(params[:id])
  end

  def show
  end

  def create
    
  end

  def update
  end

  def destroy
  end

  private
    def favorite_params
      params.permit(:user_id, :favorite_user_id)
    end
end
