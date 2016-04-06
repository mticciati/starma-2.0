class Message < ActiveRecord::Base
  validates :body, presence: true

  belongs_to :conversation
  belongs_to :user

  validates_presence_of :body, :conversation_id, :user_id

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