class PagesController < ApplicationController

	def welcome
		redirect_to dashboard_path if logged_in?
	end

	def home
	end

	def about
	end

	def contact
	end

end
