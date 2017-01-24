class MessagesController < ApplicationController

	# validate current_user

	before_action do 
		@conversation = Conversation.find(params[:conversation_id])
	end

	def show
		# individual message
	end

	def new
		@message = @conversation.messages.new
	end

	def create
		@message = @conversation.messages.new(message_params)
		# if conversation_id.exist? @message.conversation_id = conversation_id
		if @message.save
			flash[:success] = "Message Sent!"
			redirect_to root_path
			# redirect_to whatever user was last viewing
		else
			flash[:danger] = "We can't send an empty message!"
			redirect_to new_conversation_message_path(@conversation)
		end
	end

	private

	def message_params
		params.require(:message).permit(:body).merge(user_id: current_user.id)
	end

end