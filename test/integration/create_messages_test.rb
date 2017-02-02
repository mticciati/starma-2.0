require 'test_helper'

class CreateMessagesTest < ActionDispatch::IntegrationTest

  # fixtures :all

  def setup
    # @user = users(:one)
    # sign_in users(:one)
    @conversation = Conversation.create({ :sender_id => 1, :recipient_id => 2 })
  end

  test 'get new message form and create message' do

    get new_conversation_message_path(@conversation.id)
    assert_response :success
  end

end