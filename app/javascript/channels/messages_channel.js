import consumer from "./consumer"

consumer.subscriptions.create("MessagesChannel", {
    connected() {
        // Called when the subscription is ready for use on the server
    },

    disconnected() {
        // Called when the subscription has been terminated by the server
    },

    received(data) {
        $('#message-container').append(data.mod_message)
        $('#message-container').scrollTop($('#message-container')[0].scrollHeight)
        $('#message-input').val('') // issue: deletes input of receiver also
    }
});
