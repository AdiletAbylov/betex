defmodule Betex.Kaffe.MessageProducer do
  @moduledoc """
  Module provides functions to put message to the Kafka.
  """

  @doc """
  Puts `viewing` event in to the Kafka.
  Returns `:ok` on success case.
  Returns `{:error, reason}` on error case.
  """
  def viewing_message(id), do: put_message({"viewing", "#{id}"})

  @doc """
  Puts `viewing` event in to the Kafka.
  Returns `:ok` on success case.
  Returns `{:error, reason}` on error case.
  """
  def left_message(id), do: put_message({"left", "#{id}"})

  # TODO: service messages should go to the another topic.
  defp put_message(message),
    do: Kaffe.Producer.produce(Application.get_env(:betex, :topics) |> List.first(), [message])
end
