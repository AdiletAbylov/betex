defmodule BetexWeb.SportChannel do
  use Phoenix.Channel
  # intercept ["update"]

  def join("sport:lobby", _payload, socket) do
    {:ok, socket}
  end

  # def handle_in("update", message, socket) do
  #   IO.inspect(message, label: "Channel message in")
  #   BetexWeb.Endpoint.broadcast!("sport", "update", %{message: message})
  #   {:reply, :ok, socket}
  # end
end
