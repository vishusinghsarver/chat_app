import consumer from "channels/consumer"

consumer.subscriptions.create("MessagesChannel", {
  connected() {
    console.log(consumer.subscriptions)
    console.log("hello")
    
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel
  },

  speak: function() {
    return this.perform('speak');
  }
});
