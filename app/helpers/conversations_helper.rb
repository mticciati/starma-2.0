module ConversationsHelper

  def sender_or_recipient(user, conversation)

    other_user = current_user == conversation.sender ? conversation.recipient : conversation.sender
    other_user.email

  end

  def message_from(user, message)

    user == message.user ? "me" : message.user.email

  end

end