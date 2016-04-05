class MessagesController < ApplicationController

	# validate current_user

	def index
		# @conversations = Message.conversations(current_user.id)
		@message = Message.new
	end

	def show
		# message thread
	end

	def new
		@receiver = User.find(params['user'])
		@message = Message.new
		@message.receiver_id = @receiver.id
	end

	def create
		@message = Message.new(message_params)
		if @message.save
			flash[:sucess] = "Message Sent!"
			redirect_to root_path
			# redirect_to whatever user was last viewing
		else
			flash[:danger] = "We can't send an empty message!"
			redirect_to new_message_path(user: @message.receiver_id)
		end
	end

	private

	def message_params
		params.require(:message).permit(:body, :receiver_id).merge(sender_id: current_user.id)
	end

end