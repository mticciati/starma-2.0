class InboxController < ApplicationController
  before_filter :authenticate_user!
  
  def show
    @inbox = Inbox.new(current_user)
  end

end