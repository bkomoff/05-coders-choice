defmodule Stratego.Game do
    
    def new_game(player) when player in [:red, :blue] do
        %Stratego.Game.State{team: player}
    end

    def new_game(player) do
        IO.write "#{player} is invalid (:red or :blue)"
    end


    def view_board() do
        Stratego.Board.print_board()
    end

    def place_piece(player, piece, {column, row}) do
        Stratego.Squares.place_piece(player, piece, {column, row})
    end

    def move_piece(player, {column, row}, direction) do
        Stratego.Squares.move_piece( player, {column, row}, direction)
    end
end