class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  layout :layout_by_resource
  before_action :set_current_user
  helper_method :logged_in?, :set_current_user, :admin?

  def logged_in?
    !!current_user
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :birthday])
  end

  def layout_by_resource
    devise_controller? ? "devise" : "application"    
  end

  def set_current_user
  	@current_user ||= current_user 
  end

  def admin?
    current_user.role == "admin"
  end
  
end