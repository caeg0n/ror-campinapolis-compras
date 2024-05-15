class AdminChannel < ApplicationCable::Channel
  
  def subscribed
    stream_from "admin_channel"
    ActionCable.server.broadcast 'admin_channel', data: "websocket pronto from admin"
  end


end