import consumer from "./consumer";

const chatChannel = consumer.subscriptions.create("RoomChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  // room_channel.rbでブロードキャストされたものがここに届く
  // 非同期でアラートの代わりに画面に文字を表示させる
  received: function (data) {
    return $("#messages").append(data["message"]);
    // Called when there's incoming data on the websocket for this channel
  },

  // channelのspeakを実行させるためにjsでspeak関数を定義する
  // これが実行されるとコンシューマになったRoomChannel#speak({ message: message })が呼ばれる
  speak: function (message) {
    return this.perform("speak", {
      message: message,
    });
  },
});

$(document).on("keypress", "[data-behavior~=room_speaker]", function (event) {
  if (event.keyCode === 13) {
    chatChannel.speak(event.target.value);
    event.target.value = "";
    return event.preventDefault();
  }
});
