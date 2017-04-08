defmodule Health.Router do
  use Plug.Router
  require Logger

  plug Plug.Logger
  plug :match
  plug :dispatch

  def init(options) do
    options
  end

  def start_link do
    {:ok, _} = Plug.Adapters.Cowboy.http Health.Router, []
  end

  get "/health" do
    conn
    |> send_resp(200, "fine")
  end

  get "/" do
    conn
    |> send_resp(400, "ok")
    |> halt
  end
end
