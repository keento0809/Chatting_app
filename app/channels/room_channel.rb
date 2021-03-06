class RoomChannel < ApplicationCable::Channel
  def subscribed
    # room_channelをストリームする
    stream_from "room_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    # jsで実行されたspeakのmessageを受け取り、room_channelのreceivedにブロードキャストする
    # ActionCable.server.broadcast 'room_channel', message: data['message']

    # speakアクションの書き換え
    Message.create! content: data['message']
  end
end
