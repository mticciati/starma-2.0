class ChartsController < ApplicationController
  before_filter :authenticate_user!

  def index
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

  def chart_params
    params.require(:chart).permit(:location, :time)
  end
end
