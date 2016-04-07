class Conversation < ActiveRecord::Base

  belongs_to :sender, :foreign_key => :sender_id, class_name: 'User'
  belongs_to :recipient, :foreign_key => :recipient_id, class_name: 'User' 

  has_many :messages, dependent: :destroy

  validates_uniqueness_of :sender_id, :scope => :recipient_id

  ## get conversation between two users
  scope :between, -> (sender_id,recipient_id) do
    where(
      "(conversations.sender_id = ? AND conversations.recipient_id =?) 
      OR (conversations.sender_id = ? AND conversations.recipient_id =?)", 
      sender_id, recipient_id, recipient_id, sender_id)
  end

  ## get all conversations for current_user
  scope :get_all, ->(current_user) do 
    where(
      "(conversations.sender_id = ? OR conversations.recipient_id = ?)", 
      current_user, current_user) 
  end
  
  ## get specific conversation using current_user id for security
  scope :get_conversation, ->(user_id, conversation_id) do
    where(
      "(conversations.sender_id = ? OR conversations.recipient_id =?) AND id = ?", 
      user_id, user_id, conversation_id) 
  end
end