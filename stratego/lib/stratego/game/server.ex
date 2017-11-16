defmodule Stratego.Game.Server do
    use GenServer

    def start_link() do
        GenServer.start_link(__MODULE__, [], name: __MODULE__)
    end

    def handle_call(:new_game, _from, state) do
      { :reply, Stratego.Game.new_game(), state }
    end
        
    
end