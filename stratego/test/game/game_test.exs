defmodule StrategoGameTest do
    use ExUnit.Case
    doctest Stratego.Game

    test "Create new game" do
        game = Stratego.Game.new_game()
        assert game === %Stratego.Board.State{game_state: :initialize, turn: :human}
    end

    # test "Place piece on a square" do
    # end

    # test "Place all 40 pieces on the board" do
    # end

    
    
end