class ChatChannel < ApplicationCable::Channel
  def subscribed
    # stream_fromによってクライアントが聞くべき、ストリームの名前を指定する
    stream_from "chat:message"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def put_message
    # chat:messageストリームに'hello'を送信している
    ChatChannel.broadcast_to('message', 'hello')
  end
end
