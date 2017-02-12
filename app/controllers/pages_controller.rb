class PagesController < ApplicationController

	def welcome
    if logged_in?
      if admin?
        redirect_to admin_path
      else
        redirect_to dashboard_path 
      end
    end
	end

	def home
	end

	def about
	end

	def contact
	end

end
