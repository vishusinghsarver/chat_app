class MessagesChannel < ApplicationCable::Channel
  def subscribed
    stream_from "MessagesChannel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  # def speak(data)
  #   ActionCable.server.boardcast 'MessagesChannel',data
  # end
  # def receive(data)
  #   ActionCable.server.boardcast('MessagesChannel',data)
  # end
end
