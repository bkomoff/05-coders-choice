defmodule Stratego.Game.Client do
    
    @server Stratego.Game.Server

    def new_game(player) do
        GenServer.call(@server, {:new_game, player})
    end

    def view_board() do
        GenServer.call(@server, :view_board)
    end

    def place_piece(game, piece, {row, column}) do
        GenServer.call(@server, {:place_piece, game, piece, {row, column}})
        |> place_piece_result(piece)
    end

    def move_piece(game, {row, column}, direction) do
        GenServer.call(@server, {:move_piece, game, {row, column}, direction})
    end
    
    defp place_piece_result(:ok, piece) do
        "Successfully placed #{piece}"
    end
end