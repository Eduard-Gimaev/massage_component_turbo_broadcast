import consumer from "./consumer"

consumer.subscriptions.create("MessagesChannel", {
  connected() {
    console.log("Connected to the Messages channel!")
  },

  disconnected() {
    console.log("Disconnected from the Messages channel!")
  },

  received(data) {
    console.log(data)
    const messages = document.getElementById('messages')
    messages.insertAdjacentHTML('beforeend', data['message'])
  }
})
