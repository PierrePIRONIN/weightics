defmodule WeighticsBackend.RecordController do
  use WeighticsBackend.Web, :controller

  alias WeighticsBackend.Record

  def index(conn, _params) do
    records = Repo.all(Record)
    render(conn, "index.json", records: records)
  end

  def create(conn, %{"record" => record_params}) do
    changeset = Record.changeset(%Record{}, record_params)

    case Repo.insert(changeset) do
      {:ok, record} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", record_path(conn, :show, record))
        |> render("show.json", record: record)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(WeighticsBackend.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    record = Repo.get!(Record, id)
    render(conn, "show.json", record: record)
  end

  def update(conn, %{"id" => id, "record" => record_params}) do
    record = Repo.get!(Record, id)
    changeset = Record.changeset(record, record_params)

    case Repo.update(changeset) do
      {:ok, record} ->
        render(conn, "show.json", record: record)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(WeighticsBackend.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    record = Repo.get!(Record, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(record)

    send_resp(conn, :no_content, "")
  end
end
