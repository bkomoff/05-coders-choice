defmodule Stratego.Game.Client do
    
    @server Stratego.Game.Server

    def new_game(player) do
        GenServer.call(@server, {:new_game, player})
    end

    def view_board() do
        GenServer.call(@server, :view_board)
    end

    def place_piece(player, piece, {column, row}) do
        GenServer.call(@server, {:place_piece, player, piece, {column, row}})
        |> place_piece_result(piece)
    end

    def move_piece(player, {column, row}, direction) do
        GenServer.call(@server, {:move_piece, player, {column, row}, direction})
    end
    
    defp place_piece_result(:ok, piece) do
        "Successfully placed #{piece}"
    end
end