defmodule Betex.Broadway.SportEvents do
  use Broadway

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
    IO.inspect(message, label: "Handle Message From Kafka")

    BetexWeb.Endpoint.broadcast!("sport:lobby", "update", %{message: data})

    message
  end
end
