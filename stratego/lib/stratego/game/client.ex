defmodule Stratego.Game.Client do
    
    @server Stratego.Game.Server

    def new_game() do
        GenServer.call(@server, :new_game)
    end

    def view_board() do
        GenServer.call(@server, :view_board)
    end

    def place_piece(player, piece, row, column) do
        GenServer.call(@server, {:place_piece, player, piece, row, column})
        |> place_piece_result(piece)
    end

    def move_piece(player, row, column, direction) do
        GenServer.call(@server, {:move_piece, player, row, column, direction})
    end
    
    defp place_piece_result(:ok, piece) do
        "Successfully placed #{piece}"
    end
end