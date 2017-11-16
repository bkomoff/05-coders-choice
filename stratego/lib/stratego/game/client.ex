defmodule Stratego.Game.Client do
    
    @server Stratego.Game.Server

    def new_game() do
        GenServer.call(@server, :new_game)
    end
end