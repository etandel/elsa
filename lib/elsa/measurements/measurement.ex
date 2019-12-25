defmodule Elsa.Measurements.Measurement do
  use Ecto.Schema
  import Ecto.Changeset

  schema "measurements" do
    field :temperature, :float

    timestamps()
  end

  @doc false
  def changeset(measurement, attrs) do
    measurement
    |> cast(attrs, [:temperature])
    |> validate_required([:temperature])
  end
end
