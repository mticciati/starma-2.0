class MessagesController < ApplicationController

	# validate current_user

	def index
		@conversations = Message.conversations(current_user.id)
		@message = Message.new
	end

	def show
		# message thread
	end

	def new
		@to = User.find(params['user'])
		@message = Message.new
		@message.to_user_id = @to.id
	end

	def create
		@message = Message.new(message_params)
		if @message.save
			flash[:sucess] = "Message Sent!"
			redirect_to root_path
			# redirect_to whatever user was last viewing
		else
			flash[:danger] = "We can't send an empty message!"
			redirect_to new_message_path(user: @message.to_user_id)
		end
	end

	private

	def message_params
		params.require(:message).permit(:body, :to_user_id).merge(from_user_id: current_user.id)
	end

end