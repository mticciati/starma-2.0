class AdminsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :require_admin

  def show
    @adminDashboard = AdminDashboard.new(current_user)
  end

end