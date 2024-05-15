class SalesmanChannel < ApplicationCable::Channel
  
  def subscribed
    stream_from "salesman_channel"
    ActionCable.server.broadcast 'salesman_channel', data: "websocket pronto"
  end


end