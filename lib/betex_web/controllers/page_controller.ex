defmodule BetexWeb.PageController do
  use BetexWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
