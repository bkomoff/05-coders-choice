defmodule StrategoGameTest do
    use ExUnit.Case
    doctest Stratego.Game

    test "Red Player Create Game" do
        game = Stratego.Game.new_game(:red)
        assert game === %Stratego.Game.State{game_state: :initialize, team: :red}
    end

    test "Place piece on a square" do
        Stratego.Game.place_piece( :red, :flag, {2, 10} )
        assert %{piece: :flag, controlled_by: :red}  === Stratego.Squares.get_square({2,10})
    end

    # test "Place all 40 pieces on the board" do
    # end

    
    
end