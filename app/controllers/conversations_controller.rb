class ConversationsController < ApplicationController

  def index
    @conversations = Conversation.get_all(current_user.id)
  end

  def show
    @conversation = Conversation.get_conversation(current_user.id, params[:id]).first
    # if @conversation.blank? redirect_to conversations_path flash[:danger] = "Conversation not found!"

    respond_to do |format|

      format.html 

      format.js

    end

  end

  def create

    if Conversation.between(params[:sender_id], params[:recipient_id]).present?
      @conversation = Conversation.between(params[:sender_id], params[:recipient_id]).first
    else
      @conversation = Conversation.create!(conversation_params)
    end

    redirect_to new_conversation_message_path(@conversation)

  end

  private

    def conversation_params
      params.require(:conversation).permit(:sender_id, :recipient_id)
    end

    def set_sender_recipient
      if current_user.id != @conversation.sender_id
        @sender = User.find(@conversation.sender_id)
        @recipient = current_user
      else
        @sender = current_user 
        @recipient = User.find(@conversation.recipient_id)
      end
    end

end