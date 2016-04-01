class Inbox

  def initialize(user)
    @user = user
  end

  def conversations
    @conversations = Message.conversations(user.id)
  end

  def new
  end

  def reply
  end

  attr_reader :user

end