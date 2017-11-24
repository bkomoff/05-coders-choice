defmodule Stratego.Game do
    
    def new_game(player) when player in [:red, :blue, :test] do
        %Stratego.Game.State{team: player}
    end

    def new_game(player) do
        IO.write "#{player} is invalid (:red or :blue)"
    end

    def view_board() do
        Stratego.Board.print_board()
    end

    def place_piece(game = %{team: team}, piece, {row, column}) when team in [:red, :blue, :test] do #red pieces on bottom half of board
        Stratego.Squares.place_piece(game.team, piece, {row, column})
        #Update game piece list
    end

    def move_piece(game = %{team: :red, game_state: state}, {row, column}, direction) when state in [:red_turn] do
        Stratego.Squares.move_piece( game.team, {row, column}, direction)
        %{game | game_state: :blue_turn} 
    end

    def move_piece(game = %{team: :blue, game_state: state}, {row, column}, direction) when state in [:blue_turn] do
        Stratego.Squares.move_piece( game.team, {row, column}, direction)
        %{game | game_state: :red_turn} 
    end

    def move_piece(game = %{team: team}, {row, column}, direction) when team in [:test] do
        Stratego.Squares.move_piece( game.team, {row, column}, direction)
        %{game | game_state: :red_turn} 
    end

    def move_piece(_,_,_) do
        IO.puts "Not your turn to move!"
    end

    
end