defmodule Elsa.Repo do
  use Ecto.Repo,
    otp_app: :elsa,
    adapter: Ecto.Adapters.Postgres
end
