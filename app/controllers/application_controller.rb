class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  layout :layout_by_resource
  before_action :set_current_user

  protected

  def layout_by_resource
    devise_controller? ? "devise" : "application"    
  end

  def set_current_user
  	@current_user = current_user unless !current_user
  end
end