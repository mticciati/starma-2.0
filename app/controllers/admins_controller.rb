class AdminsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :admin?

  def show
    @adminDashboard = AdminDashboard.new(current_user)
  end

end