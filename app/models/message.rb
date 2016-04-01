class Message < ActiveRecord::Base
  belongs_to :user
  validates :body, presence: true

  # retrieving messages
  scope :all_between, ->(current_user, other_user) { where(from_user_id: current_user.id, to_user_id: other_user) }

  scope :conversations, ->(current_user) { where(from_user_id: current_user) }
end