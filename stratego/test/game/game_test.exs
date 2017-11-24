defmodule StrategoGameTest do
    use ExUnit.Case
    doctest Stratego.Game

    test "Red Player Create Game" do
        game = Stratego.Game.new_game(:red)
        assert game === %Stratego.Game.State{game_state: :initialize, team: :red}
    end

    test "Place piece on a square" do
        game = Stratego.Game.new_game(:red)
        Stratego.Game.place_piece( game, :flag, {2, 10} )
        assert %{piece: :flag, controlled_by: :red}  === Stratego.Squares.get_square({2,10})
    end

    test "Move a piece from one square to another up direction" do
        game = Stratego.Game.new_game(:test)
        Stratego.Game.place_piece(game,:scout,{1,1})
        assert %{piece: :scout, controlled_by: :test}  === Stratego.Squares.get_square({1,1})
    
        Stratego.Game.move_piece(game, {1,1}, :up)   
        assert %{piece: :empty, controlled_by: :no_one}  === Stratego.Squares.get_square({1,1})
        assert %{piece: :scout, controlled_by: :test}  === Stratego.Squares.get_square({2,1})
             
    end

    test "Move a piece from one square to another down direction" do
        game = Stratego.Game.new_game(:test)
        Stratego.Game.place_piece(game,:scout,{2,3})
        assert %{piece: :scout, controlled_by: :test}  === Stratego.Squares.get_square({2,3})

        game = Stratego.Game.new_game(:test)
        Stratego.Game.move_piece(game, {2,3}, :down)   
        assert %{piece: :empty, controlled_by: :no_one}  === Stratego.Squares.get_square({2,3})
        assert %{piece: :scout, controlled_by: :test}  === Stratego.Squares.get_square({1,3})
             
    end

    test "Move a piece from one square to another left direction" do
        game = Stratego.Game.new_game(:test)
        Stratego.Game.place_piece(game,:scout,{2,3})
        assert %{piece: :scout, controlled_by: :test}  === Stratego.Squares.get_square({2,3})

        Stratego.Game.move_piece(game, {2,3}, :left)   
        assert %{piece: :empty, controlled_by: :no_one}  === Stratego.Squares.get_square({2,3})
        assert %{piece: :scout, controlled_by: :test}  === Stratego.Squares.get_square({2,2})

    end

    test "Move a piece from one square to another right direction" do
        game = Stratego.Game.new_game(:test)
        Stratego.Game.place_piece(game,:scout,{2,3})
        assert %{piece: :scout, controlled_by: :test}  === Stratego.Squares.get_square({2,3})

        Stratego.Game.move_piece(game, {2,3}, :right)   
        assert %{piece: :empty, controlled_by: :no_one}  === Stratego.Squares.get_square({2,3})
        assert %{piece: :scout, controlled_by: :test}  === Stratego.Squares.get_square({2,4})
             
    end

    test "Other players turn" do
        game = Stratego.Game.new_game(:test)

        assert game === %Stratego.Game.State{game_state: :initialize, team: :test}

        Stratego.Game.place_piece(game,:scout,{2,3})
        assert %{piece: :scout, controlled_by: :test}  === Stratego.Squares.get_square({2,3})

        game = Stratego.Game.move_piece(game, {2,3}, :right)   
        assert game === %Stratego.Game.State{game_state: :red_turn, team: :test}     
    end

    # test "Place all 40 pieces on the board" do
    # end

    
    
end