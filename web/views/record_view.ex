defmodule WeighticsBackend.RecordView do
  use WeighticsBackend.Web, :view

  def render("index.json", %{records: records}) do
    %{data: render_many(records, WeighticsBackend.RecordView, "record.json")}
  end

  def render("show.json", %{record: record}) do
    %{data: render_one(record, WeighticsBackend.RecordView, "record.json")}
  end

  def render("record.json", %{record: record}) do
    %{id: record.id,
      weight: record.weight,
      fatPercent: record.fatPercent,
      waterPercent: record.waterPercent,
      muscleMass: record.muscleMass,
      boneMass: record.boneMass,
      bodyMassIndex: record.bodyMassIndex}
  end
end
