class ClientChannel < ApplicationCable::Channel
  
  def subscribed
    stream_from "client_channel"
    ActionCable.server.broadcast 'client_channel', data: "websocket pronto"
  end

end