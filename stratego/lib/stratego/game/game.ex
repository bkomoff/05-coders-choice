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

    def player_ready(game, player) when player in [:red] do
        game = Map.put(game, :red_team_state, :ready_to_play)

        game
        |> update_turn(game, player)
    end

    def player_ready(game, player) when player in [:blue] do
        game = Map.put(game, :blue_team_state, :ready_to_play)
        
        game
        |> update_turn(game,player)
    end

    def game_state(game) do
        %{ game_state: game.game_state, 
           blue_team_state: game.blue_team_state,
           red_team_state: game.red_team_state,
        }
    end

    def get_square({row, column}) do
        Stratego.Squares.get_square({row, column})
    end

    def place_piece(player, piece, {row, column}) when player in [:red, :blue] do 
        Stratego.Squares.place_piece(player, piece, {row, column})
    end
        
    def move_piece(game = %{game_state: state}, {row, column}, direction) when state in [:red_turn] do
        game
        |> update_squares(:red, {row,column}, direction)
    end

    def move_piece(game = %{game_state: state}, {row, column}, direction) when state in [:blue_turn] do
        game
        |> update_squares(:blue, {row,column}, direction)
    end

    def move_piece(game = %{game_state: state}, _, _) when state in [:red_won, :blue_won] do
        IO.puts "#{game.game_state}" 
    end

    def move_piece(_,_,_) do
        IO.puts "Not your turn to move!"
    end

    defp update_squares(game, player, location, direction) do
        from_square = Stratego.Squares.get_square(location)
        from_piece = Map.get(from_square, :piece)

        to_square = Stratego.Squares.get_square(next_square(direction, location))
        to_piece = Map.get(to_square, :piece)
        
        Stratego.Rules.strike(from_piece, to_piece)
        |> Stratego.Squares.move_piece( from_piece, player, location, next_square(direction, location)) 
        |> update_turn(game, player)
        
    end

    defp update_turn(:flag_captured, game = %{red_team_state: :ready_to_play, blue_team_state: :ready_to_play}, player) when player in [:red] do
        %{game | game_state: :red_won}
    end

    defp update_turn(:flag_captured, game = %{red_team_state: :ready_to_play, blue_team_state: :ready_to_play}, player) when player in [:blue] do
        %{game | game_state: :blue_won}
    end

    defp update_turn(_, game = %{red_team_state: :ready_to_play, blue_team_state: :ready_to_play}, player) when player in [:red] do
        %{game | game_state: :blue_turn}
    end

    defp update_turn(_, game = %{red_team_state: :ready_to_play, blue_team_state: :ready_to_play}, player) when player in [:blue] do
        %{game | game_state: :red_turn}
    end

    defp update_turn(_, game,_), do: game

    defp next_square(:up, {row, column}) do {row + 1, column} end
    defp next_square(:down, {row, column}) do {row - 1, column} end    
    defp next_square(:left, {row, column}) do {row, column - 1} end    
    defp next_square(:right, {row, column}) do {row, column + 1} end    
end