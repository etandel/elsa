defmodule Elsa.Repo.Migrations.CreateMeasurements do
  use Ecto.Migration

  def change do
    create table(:measurements) do
      add :temperature, :float

      timestamps()
    end

    create index(:measurements, [:inserted_at])
  end
end
