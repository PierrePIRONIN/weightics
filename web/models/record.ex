defmodule WeighticsBackend.Record do
  use WeighticsBackend.Web, :model

  schema "records" do
    field :weight, :float
    field :fatPercent, :float
    field :waterPercent, :float
    field :muscleMass, :float
    field :boneMass, :float
    field :bodyMassIndex, :float

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:weight, :fatPercent, :waterPercent, :muscleMass, :boneMass, :bodyMassIndex])
    |> validate_required([:weight, :fatPercent, :waterPercent, :muscleMass, :boneMass, :bodyMassIndex])
  end
end
