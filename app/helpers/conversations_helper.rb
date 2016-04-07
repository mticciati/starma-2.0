module ConversationsHelper

  def sender_or_recipient(conversation)

    other_user = current_user == conversation.sender ? conversation.recipient : conversation.sender
    other_user.email

  end

  def message_from(message)

    current_user == message.user ? "me" : message.user.email

  end

  def unread_messages

    conversations = Conversation.get_all(current_user.id)

    unread = 0

    if conversations.present?
      
      conversations.each do |c|
        unread += Message.unread_messages(current_user.id, c.id)
      end
    end

    return unread

  end


end