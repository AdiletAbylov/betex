defmodule Betex.Broadway.SportEvents do
  @moduledoc """
  Module uses Broadway behaviour to consume messages from Kafka and broadcast them into `sport` channel.
  """
  use Broadway
  require Logger

  def start_link(_) do
    Broadway.start_link(__MODULE__,
      name: __MODULE__,
      producer: [
        module:
          {BroadwayKafka.Producer,
           [
             hosts: Application.get_env(:betex, :hosts),
             group_id: Application.get_env(:betex, :consumer_group),
             topics: Application.get_env(:betex, :topics)
           ]},
        concurrency: 1
      ],
      processors: [
        default: [concurrency: 10]
      ]
    )
  end

  def handle_message(_processor_name, %{data: data} = message, _context) do
    Logger.info(
      "Handle Message From Kafka and broadcast it to the 'sport' channel #{inspect(message)}"
    )

    BetexWeb.Endpoint.broadcast!("sport", "update", %{message: data})

    message
  end
end
