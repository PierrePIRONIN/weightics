defmodule WeighticsBackend.Router do
  use WeighticsBackend.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", WeighticsBackend do
    pipe_through :api

    resources "/records", RecordController
  end
end
