class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room_#{params[:room_code]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
