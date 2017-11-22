defmodule Stratego.Game do
    
    def new_game() do
        %Stratego.Game.State{}
    end

    def view_board() do
        Stratego.Board.print_board()
    end

    def place_piece(player, piece, {row, column}) do
        Stratego.Squares.place_piece(player, piece, {row, column})
    end

    def move_piece(player, row, column, direction) do
        Stratego.Squares.move_piece( player, {row, column}, direction)
    end

    defp update_game_state(:red_team, square) do
        #update read team list
    end

    defp update_game_state(:blue_team, square) do
        #update blue team list
    end
end