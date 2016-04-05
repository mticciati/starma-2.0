class Inbox

  def initialize(user)
    @user = user
  end

  def conversations
    @conversations = Message.conversations(user.id)
  end

  def conversation
  end

  def message
    @message = Message.new
    #@message.from_user_id = user.id
    #@message.body = "Hello"
  end

  def send
    # @message.to_user_id = get user id from username
  end

  attr_reader :user

end