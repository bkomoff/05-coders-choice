defmodule StrategoGameTest do
    use ExUnit.Case
    doctest Stratego.Game

    test "Red Player Create Game" do
        game = Stratego.Game.new_game(:red)
        assert game === %Stratego.Game.State{game_state: :initialize, red_team_state: :placing_piece}
    end

    test "Blue Player Create Game" do
        game = Stratego.Game.new_game(:blue)
        assert game === %Stratego.Game.State{game_state: :initialize, blue_team_state: :placing_piece}
    end

    test "Place piece on a square" do
        game = Stratego.Game.new_game(:red)
        Stratego.Game.place_piece( game, :flag, {2, 10} )
        assert %{piece: :flag, controlled_by: :red}  === Stratego.Squares.get_square({2,10})
    end

    test "Move a piece from one square to another up direction" do
        game = Stratego.Game.new_game(:red)
        Stratego.Game.place_piece(game,:scout,{1,1})
        assert %{piece: :scout, controlled_by: :red}  === Stratego.Squares.get_square({1,1})
    
        game = Map.put(game,:game_state, :red_turn)

        Stratego.Game.move_piece(game, {1,1}, :up)   
        assert %{piece: :empty, controlled_by: :no_one}  === Stratego.Squares.get_square({1,1})
        assert %{piece: :scout, controlled_by: :red}  === Stratego.Squares.get_square({2,1})
             
    end

    test "Move a piece from one square to another down direction" do
        game = Stratego.Game.new_game(:red)
        Stratego.Game.place_piece(game,:scout,{3,3})
        assert %{piece: :scout, controlled_by: :red}  === Stratego.Squares.get_square({3,3})
    
        game = Map.put(game,:game_state, :red_turn)

        Stratego.Game.move_piece(game, {3,3}, :down)   
        assert %{piece: :empty, controlled_by: :no_one}  === Stratego.Squares.get_square({3,3})
        assert %{piece: :scout, controlled_by: :red}  === Stratego.Squares.get_square({2,3})
    end

    test "Move a piece from one square to another left direction" do
        game = Stratego.Game.new_game(:red)
        Stratego.Game.place_piece(game,:scout,{3,3})
        assert %{piece: :scout, controlled_by: :red}  === Stratego.Squares.get_square({3,3})
    
        game = Map.put(game,:game_state, :red_turn)

        Stratego.Game.move_piece(game, {3,3}, :left)   
        assert %{piece: :empty, controlled_by: :no_one}  === Stratego.Squares.get_square({3,3})
        assert %{piece: :scout, controlled_by: :red}  === Stratego.Squares.get_square({3,2})
    end
    test "Move a piece from one square to another right direction" do
        game = Stratego.Game.new_game(:red)
        Stratego.Game.place_piece(game,:scout,{3,3})
        assert %{piece: :scout, controlled_by: :red}  === Stratego.Squares.get_square({3,3})
    
        game = Map.put(game,:game_state, :red_turn)

        Stratego.Game.move_piece(game, {3,3}, :right)   
        assert %{piece: :empty, controlled_by: :no_one}  === Stratego.Squares.get_square({3,3})
        assert %{piece: :scout, controlled_by: :red}  === Stratego.Squares.get_square({3,4})           
    end

    test "Other players turn" do
        game = Stratego.Game.new_game(:red)
        assert game === %Stratego.Game.State{game_state: :initialize}
        Stratego.Game.place_piece(game,:scout,{2,3})
        assert %{piece: :scout, controlled_by: :red}  === Stratego.Squares.get_square({2,3})

        game = Map.put(game,:game_state, :red_turn)
        
        game = Stratego.Game.move_piece(game, {2,3}, :right)   
        assert game === %Stratego.Game.State{game_state: :blue_turn}     
    end

    test "Place all 40 pieces on the board" do
        game = Stratego.Game.new_game(:red)
        
    end

    test "marshal attacks and defeats general" do
        red_player  = Stratego.Game.new_game(:red)
        blue_player = Stratego.Game.new_game(:blue)
        
        Stratego.Game.place_piece(red_player,:marshal,{1,1})
        Stratego.Game.place_piece(blue_player,:general,{2,1})

        red_player = Map.put(red_player, :game_state, :red_turn)

        Stratego.Game.move_piece(red_player, {1,1}, :up)
        assert %{piece: :empty, controlled_by: :no_one}  === Stratego.Squares.get_square({1,1})
        assert %{piece: :marshal, controlled_by: :red}  === Stratego.Squares.get_square({2,1})
    end
    
    test "flag is captured" do
        red_player  = Stratego.Game.new_game(:red)
        blue_player = Stratego.Game.new_game(:blue)
        
        Stratego.Game.place_piece(red_player,:marshal,{1,1})
        Stratego.Game.place_piece(blue_player,:flag,{2,1})

        red_player = Map.put(red_player, :game_state, :red_turn)

        Stratego.Game.move_piece(red_player, {1,1}, :up)
        assert %{piece: :empty, controlled_by: :no_one}  === Stratego.Squares.get_square({1,1})
        assert %{piece: :marshal, controlled_by: :red}  === Stratego.Squares.get_square({2,1})
    end
    
end