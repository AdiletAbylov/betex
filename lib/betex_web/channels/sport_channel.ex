defmodule BetexWeb.SportChannel do
  @moduledoc """
  Module handles `sport:*` channel events.
  """
  use Phoenix.Channel

  alias Betex.Kaffe.MessageProducer

  def join("sport:lobby", _payload, socket) do
    {:ok, socket}
  end

  def handle_in("viewing", _message, socket) do
    MessageProducer.viewing_message("some_id")
    {:noreply, socket}
  end

  def handle_in("left", _message, socket) do
    MessageProducer.viewing_message("some_id")
    {:noreply, socket}
  end
end
