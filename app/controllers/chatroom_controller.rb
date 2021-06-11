class ChatroomController < ApplicationController

  before_action :require_user

  def index
    #this will initalize the @message instance variable
    @message = Message.new

    @messages = Message.custom_display
    Rails.logger.debug "Messages: #{@messages.inspect}"
  end

end
