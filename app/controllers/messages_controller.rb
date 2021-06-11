class MessagesController < ApplicationController

  before_action :require_user

  def create
    #this will be generated automatically
    message = current_user.messages.build(message_params)
    message.valid?
    Rails.logger.debug "why not: #{message.errors.full_messages}"
    if message.save
      #here we will broadcast to the Channel
      #this take the form of a hash and it will go to the chatroom.coffee file(received: (data))
      ActionCable.server.broadcast "chatroom_channel",
                                    #key is foo and value is message.body
                                    #foo: message.body

                                    #here we are going to call the message_render method and pass in message object so we can render the message properly by using the partial
                                    mod_message: message_render(message)

      #redirect_to root_path
    end
  end

  private

  def message_params
    params.require(:message).permit(:body)
  end

  def message_render(message)
    # to call a parital in the controller, you do this below
    # locals: {message: message} is to pass the message object into the parital, local takes it as a hash
    render(partial: 'message', locals: {message: message})
     
  end




end
