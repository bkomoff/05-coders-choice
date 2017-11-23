defmodule RedPlayer.Impl do
    def play() do
        Stratego.Game.new_game(:red)
    end
end