defmodule Stratego.Game do

    def new_game() do
        %Stratego.Game.State{}
    end

    def new_game(player) when player in [:red, :blue] do
        %Stratego.Game.State{team: player}
    end

    def new_game(player) do
        IO.write "#{player} is invalid (:red or :blue)"
    end

    def game_state(game) do
        %{ game_state: game.game_state, 
           blue_team_state: game.blue_team_state,
           red_team_state: game.red_team_state,
           team: game.team
        }
    end

    # def retrieve_pieces_list(game = %{team: team}) when team in [:red] do
    #     %{red_pieces: game.red_pieces}
    #     game_state(game)        
    # end

    # def retrieve_pieces_list(game = %{team: team}) when team in [:blue] do
    #     %{blue_pieces: game.blue_pieces}                
    # end

    def view_board() do
        Stratego.Board.print_board()
    end

    def place_piece(game = %{team: team}, piece, {row, column}) when team in [:red, :blue] do 
        status = Stratego.Squares.place_piece(game.team, piece, {row, column})
        
        game
    end

    # defp piece_placed(game, status, team, piece) when team in [:red] and status in [:piece_accepted] do
    #     Map.put(game, :red_pieces, [ piece | game.red_pieces ])         
    # end

    # defp piece_placed(game, status = :piece_accepted, team, piece) when team in [:blue] and status in [:piece_accepted] do
    #     Map.put(game, :blue_pieces, [ piece | game.blue_pieces ])         
    # end

    # defp piece_placed(game, _status, _team, _piece) do
    #     game_state(game)
    # end
        
    def move_piece(game = %{team: :red, game_state: state}, {row, column}, direction) when state in [:red_turn] do
        from_square = Stratego.Squares.get_square({row,column})
        from_piece = Map.get(from_square, :piece)

        to_square = Stratego.Squares.get_square(next_square(direction, {row,column}))
        to_piece = Map.get(to_square, :piece)
        
        Stratego.Rules.strike(from_piece, to_piece)
        |> Stratego.Squares.move_piece(from_piece, :red, {row,column}, next_square(direction, {row,column}))
        
        %{game | game_state: :blue_turn} 
    end

    def move_piece(game = %{team: :blue, game_state: state}, {row, column}, direction) when state in [:blue_turn] do                         
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