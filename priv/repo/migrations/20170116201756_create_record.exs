defmodule WeighticsBackend.Repo.Migrations.CreateRecord do
  use Ecto.Migration

  def change do
    create table(:records) do
      add :weight, :float
      add :fatPercent, :float
      add :waterPercent, :float
      add :muscleMass, :float
      add :boneMass, :float
      add :bodyMassIndex, :float

      timestamps()
    end

  end
end
