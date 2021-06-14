# Betex

Prototype project to test Kafka and Phoenix Channels.

It uses `broadway` with `broadway_kafka` to handle messages from kafka and broadcasts them to the Phoenix Channel. Broadway module is `Betex.Broadway.SportEvents`. Phoenix channel is `BetexWeb.SportChannel`.
JS client implemented in `socket.js` file.

# How to test it:

1. Run Kafka on 9092 port and create topic "sport-events-topic".
2. Start Phoenix and open `localhost:4000` page.
3. Open js-console on web-browser. You can see that js client connected to the channel "sport"
4. Send message in Kafka to the given topic.
5. See that same message received in browser console.



To start your Phoenix server:

  * Setup the project with `mix setup`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.