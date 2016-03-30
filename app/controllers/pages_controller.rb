class PagesController < ApplicationController

	def welcome
		if current_user 
			redirect_to dashboard_path
		end
	end

	def home
	end

	def about
	end

	def contact
	end

end
