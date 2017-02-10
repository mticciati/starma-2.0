require 'test_helper'

class CreateMessagesTest < ActionDispatch::IntegrationTest

  def sign_in_as(user)
    post user_session_path, user: { 'user[email]' => user.email, 'user[password]' => user.encrypted_password }
  end

  def setup
    @user = users(:one)
    sign_in_as @user
    @conversation = Conversation.create({ :sender_id => 1, :recipient_id => 2 })
  end

  # test 'get new message form and create message' do

  #   get new_conversation_message_path(@conversation.id)
  #   assert_response :success
  # end

end