defmodule Betex.Kaffe.MessagesProcessor do
  @moduledoc """
  Worker module to process messages from Kafka. See config.exs for Kaffe app configs.
  """

  def handle_messages(messages) do
    for %{key: key, value: value} = message <- messages do
      IO.inspect(message)
      IO.puts("#{key}: #{value}")
      BetexWeb.Endpoint.broadcast!("sport:notifications", "update", %{message: value})
    end

    :ok
  end
end
