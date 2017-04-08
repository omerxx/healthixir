defmodule Health.Supervisor do  
  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
      worker(Health.Router, [])
    ]

    opts = [strategy: :one_for_one, name: Health.Supervisor]
    Supervisor.start_link(children, opts)
  end
end 
