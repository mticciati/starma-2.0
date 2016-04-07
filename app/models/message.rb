class Message < ActiveRecord::Base
  validates :body, presence: true

  belongs_to :conversation
  belongs_to :user

  validates_presence_of :body, :conversation_id, :user_id


  scope :unread_messages, ->(user_id, conversation_id) do
    where.not(user_id: user_id).where(conversation_id: conversation_id, read: 0).count
  end

  scope :mark_as_read, ->(user_id, conversation_id) do
    where.not(user_id: user_id).where(conversation_id: conversation_id).update_all(read: 1)
  end
  # before save if conversation_id.blank? increment(conversation_id:, by 1)

  # retrieving messages
  # TODO get the query right...
  # scope :all_between, ->(current_user, other_user) { where('(sender_id: current_user.id, receiver_id: other_user OR sender_id: other_user, receiver_id: current_user.id)') }

  # TODO
  # needs to be chronological, only include DISTINCT conversation_id per sender_id
  # how to do AND and OR etc in where  
  # if a row exists with current_user.id and other_user return conversation_id 
  # distinct(:conversation_id) ?
  # scope :conversations, ->(current_user) { where(:conversation_id).distinct.where(sender_id: current_user).order('created_at desc') } 

end