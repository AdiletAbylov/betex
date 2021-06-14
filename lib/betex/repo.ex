defmodule Betex.Repo do
  use Ecto.Repo,
    otp_app: :betex,
    adapter: Ecto.Adapters.Postgres
end
