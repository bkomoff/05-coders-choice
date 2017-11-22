defmodule StrategoGameTest do
    use ExUnit.Case
    doctest Stratego.Game

    test "Create new game" do
        game = Stratego.Game.new_game()
        assert game === %Stratego.Game.State{game_state: :initialize, turn: :player_one}
    end

     test "Place piece on a square" do
        game = Stratego.Game.new_game()
        Stratego.Game.place_piece( :flag, 2, 10 )
        {:flag, :player_one} = Stratego.Sqaures.get_square({2,10})
     end

    # test "Place all 40 pieces on the board" do
    # end

    
    
end