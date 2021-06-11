App.chatroom = App.cable.subscriptions.create "ChatroomChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel

    #this below is to verify that the message alert is working
    #alert data.foo

    # $ means a string
    #for classes you put .
    #for ids you put #
    #$('#message-container').append data.foo

    $('#message-container').append data.mod_message
    #calling function below for when a message sends it will automatically go to the bottom
    scroll_bottom()
