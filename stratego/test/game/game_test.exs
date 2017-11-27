defmodule StrategoGameTest do
    use ExUnit.Case
    doctest Stratego.Game

    test "Red Player Create Game" do
        game = %Stratego.Game.State{game_state: :initialize, red_team_state: :not_joined}
        game = Stratego.Game.new_game(game, :red)
        assert game === %Stratego.Game.State{game_state: :initialize, red_team_state: :placing_pieces}
    end

    test "Blue Player Create Game" do
        game = %Stratego.Game.State{game_state: :initialize, blue_team_state: :not_joined}
        blue_game = Stratego.Game.new_game(game, :blue)
        assert blue_game === %Stratego.Game.State{game_state: :initialize, blue_team_state: :placing_pieces}
    end

    test "Place piece on a square" do
        Stratego.Game.Server.place_piece( :red, :flag, {2, 10} )
        assert %{piece: :flag, controlled_by: :red}  === Stratego.Squares.get_square({2,10})
    end

    test "Move a piece from one square to another up direction" do
        Stratego.Game.place_piece(:red,:scout,{1,1})
        assert %{piece: :scout, controlled_by: :red}  === Stratego.Squares.get_square({1,1})

        game = %Stratego.Game.State{}
        game = Stratego.Game.player_ready(game, :red)
        game = Stratego.Game.player_ready(game, :blue)

        Stratego.Game.move_piece(game, {1,1}, :up)   
        assert %{piece: :empty, controlled_by: :no_one}  === Stratego.Squares.get_square({1,1})
        assert %{piece: :scout, controlled_by: :red}  === Stratego.Squares.get_square({2,1})
             
    end

    test "Move a piece from one square to another down direction" do
        Stratego.Game.place_piece(:red,:scout,{3,3})
        assert %{piece: :scout, controlled_by: :red}  === Stratego.Squares.get_square({3,3})
    
        game = %Stratego.Game.State{}
        game = Stratego.Game.player_ready(game, :red)
        game = Stratego.Game.player_ready(game, :blue)

        Stratego.Game.move_piece(game, {3,3}, :down)   
        assert %{piece: :empty, controlled_by: :no_one}  === Stratego.Squares.get_square({3,3})
        assert %{piece: :scout, controlled_by: :red}  === Stratego.Squares.get_square({2,3})
    end

    test "Move a piece from one square to another left direction" do
        Stratego.Game.place_piece(:red,:scout,{3,3})
        assert %{piece: :scout, controlled_by: :red}  === Stratego.Squares.get_square({3,3})
    
        game = %Stratego.Game.State{}
        game = Stratego.Game.player_ready(game, :red)
        game = Stratego.Game.player_ready(game, :blue)

        Stratego.Game.move_piece(game, {3,3}, :left)   
        assert %{piece: :empty, controlled_by: :no_one}  === Stratego.Squares.get_square({3,3})
        assert %{piece: :scout, controlled_by: :red}  === Stratego.Squares.get_square({3,2})
    end

    test "Move a piece from one square to another right direction" do
        Stratego.Game.place_piece(:red,:scout,{3,3})
        assert %{piece: :scout, controlled_by: :red}  === Stratego.Squares.get_square({3,3})
    
        game = %Stratego.Game.State{}
        game = Stratego.Game.player_ready(game, :red)
        game = Stratego.Game.player_ready(game, :blue)

        Stratego.Game.move_piece(game, {3,3}, :right)   
        assert %{piece: :empty, controlled_by: :no_one}  === Stratego.Squares.get_square({3,3})
        assert %{piece: :scout, controlled_by: :red}  === Stratego.Squares.get_square({3,4})           
    end

    test "Other players turn" do
        Stratego.Game.place_piece(:red,:scout,{2,3})
        assert %{piece: :scout, controlled_by: :red}  === Stratego.Squares.get_square({2,3})

        game = %Stratego.Game.State{}
        game = Stratego.Game.player_ready(game, :red)
        game = Stratego.Game.player_ready(game, :blue)
        
        game = Stratego.Game.move_piece(game, {2,3}, :right)   
        assert game === %Stratego.Game.State{game_state: :blue_turn, blue_team_state: :ready_to_play, red_team_state: :ready_to_play}     
    end

    test "marshal attacks and defeats general" do       
        Stratego.Game.place_piece(:red,:marshal,{1,8})
        Stratego.Game.place_piece(:blue,:general,{2,8})

        game = %Stratego.Game.State{}
        game = Stratego.Game.player_ready(game, :red)
        game = Stratego.Game.player_ready(game, :blue)

        Stratego.Game.move_piece(game, {1,8}, :up)
        assert %{piece: :empty, controlled_by: :no_one}  === Stratego.Squares.get_square({1,8})
        assert %{piece: :marshal, controlled_by: :red}  === Stratego.Squares.get_square({2,8})
    end
    
    test "flag is captured by red" do
        Stratego.Game.place_piece(:red,:marshal,{1,9})
        Stratego.Game.place_piece(:blue,:flag,{2,9})

        game = %Stratego.Game.State{}
        game = Stratego.Game.player_ready(game, :red)
        game = Stratego.Game.player_ready(game, :blue)

        game = Stratego.Game.move_piece(game, {1,9}, :up)
        assert %{piece: :empty, controlled_by: :no_one}  === Stratego.Squares.get_square({1,9})
        assert %{piece: :marshal, controlled_by: :red}  === Stratego.Squares.get_square({2,9})

        assert game === %Stratego.Game.State{game_state: :red_won, blue_team_state: :ready_to_play, red_team_state: :ready_to_play}
    end
    
end