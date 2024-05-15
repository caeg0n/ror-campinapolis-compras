class DeliverymanChannel < ApplicationCable::Channel
  
  def subscribed
    stream_from "deliveryman_channel"
    ActionCable.server.broadcast 'deliveryman_channel', data: "websocket pronto from deliveryman channel"
  end


end