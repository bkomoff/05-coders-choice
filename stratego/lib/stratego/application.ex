defmodule Stratego.Application do
  use Application

  def start(_type, _args) do
    import Supervisor.Spec

    children = 
    [
      supervisor( Stratego.Squares.Supervisor, [], restart: :transient)
    ]

    opts = [strategy: :one_for_one, name: Stratego.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
