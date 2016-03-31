class MessagesController < ApplicationController

	# validate current_user

	def index
		# @messages = Message.all(current_user)
	end

	def show
		# message thread
	end

	def new
		@to = User.find(params['user'])
		@message = Message.new
	end

	def create
		@message
	end

end