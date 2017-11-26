defmodule Stratego.Game do

    def new_game( game = %{game_state: :initialize}, player) when player in [:red] do
        %Stratego.Game.State{ game_state: game.game_state, blue_team_state: game.blue_team_state, red_team_state: :placing_pieces}
    end

    def new_game(game = %{game_state: :initialize}, player) when player in [:blue] do
        %Stratego.Game.State{ game_state: game.game_state, red_team_state: game.red_team_state, blue_team_state: :placing_pieces}
    end

    def new_game(player) do
        IO.write "#{player} is invalid (:red or :blue)"
    end

    def game_state(game) do
        %{ game_state: game.game_state, 
           blue_team_state: game.blue_team_state,
           red_team_state: game.red_team_state,
        }
    end

    def view_board() do
        Stratego.Board.print_board()
    end

    def place_piece(player, piece, {row, column}) when player in [:red, :blue] do 
        status = Stratego.Squares.place_piece(player, piece, {row, column})
    end
        
    def move_piece(game = %{game_state: state}, {row, column}, direction) when state in [:red_turn] do
        from_square = Stratego.Squares.get_square({row,column})
        from_piece = Map.get(from_square, :piece)

        to_square = Stratego.Squares.get_square(next_square(direction, {row,column}))
        to_piece = Map.get(to_square, :piece)
        
        Stratego.Rules.strike(from_piece, to_piece)
        |> Stratego.Squares.move_piece(from_piece, :red, {row,column}, next_square(direction, {row,column}))
        
        %{game | game_state: :blue_turn} 
    end

    def move_piece(game = %{game_state: state}, {row, column}, direction) when state in [:blue_turn] do                         
        from_square = Stratego.Squares.get_square({row,column})
        from_piece = Map.get(from_square, :piece)

        to_square = Stratego.Squares.get_square(next_square(direction, {row,column}))
        to_piece = Map.get(to_square, :piece)
        
        Stratego.Rules.strike(from_piece, to_piece)
        |> Stratego.Squares.move_piece(from_piece, :blue, {row,column}, next_square(direction, {row,column}))
        
        %{game | game_state: :red_turn} 
    end    
    
    def move_piece(_,_,_) do
        IO.puts "Not your turn to move!"
    end

    defp next_square(:up, {row, column}) do {row + 1, column} end
    defp next_square(:down, {row, column}) do {row - 1, column} end    
    defp next_square(:left, {row, column}) do {row, column - 1} end    
    defp next_square(:right, {row, column}) do {row, column + 1} end    
end