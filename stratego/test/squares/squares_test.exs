defmodule StrategoSqauresTest do
    use ExUnit.Case
    doctest Stratego.Squares
  
    test "Verify all valid pieces have been placed" do
        Stratego.Squares.place_piece(:red, :marshal, {1,7})
        assert %{piece: :marshal, controlled_by: :red} === Stratego.Squares.get_square({1,7})

        Stratego.Squares.place_piece(:red, :general, {2,7})
        assert %{piece: :general, controlled_by: :red} === Stratego.Squares.get_square({2,7})

        Stratego.Squares.place_piece(:red, :colonel, {3,7})
        assert %{piece: :colonel, controlled_by: :red} === Stratego.Squares.get_square({3,7})

        Stratego.Squares.place_piece(:red, :major, {4,7})
        assert %{piece: :major, controlled_by: :red} === Stratego.Squares.get_square({4,7})

        Stratego.Squares.place_piece(:red, :captain, {5,7})
        assert %{piece: :captain, controlled_by: :red} === Stratego.Squares.get_square({5,7})

        Stratego.Squares.place_piece(:red, :lieutenant, {6,7})
        assert %{piece: :lieutenant, controlled_by: :red} === Stratego.Squares.get_square({6,7})

        Stratego.Squares.place_piece(:red, :sergeant, {7,7})
        assert %{piece: :sergeant, controlled_by: :red} === Stratego.Squares.get_square({7,7})

        Stratego.Squares.place_piece(:red, :miner, {8,7})
        assert %{piece: :miner, controlled_by: :red} === Stratego.Squares.get_square({8,7})

        Stratego.Squares.place_piece(:red, :scout, {9,7})
        assert %{piece: :scout, controlled_by: :red} === Stratego.Squares.get_square({9,7})

        Stratego.Squares.place_piece(:red, :spy, {10,7})
        assert %{piece: :spy, controlled_by: :red} === Stratego.Squares.get_square({10,7})

        Stratego.Squares.place_piece(:red, :bomb, {1,8})
        assert %{piece: :bomb, controlled_by: :red} === Stratego.Squares.get_square({1,8})

        Stratego.Squares.place_piece(:red, :flag, {2,8})
        assert %{piece: :flag, controlled_by: :red} === Stratego.Squares.get_square({2,8})
    end

    test "Verify that invalid piece cannot be placed" do
        assert :piece_rejected === Stratego.Squares.place_piece(:red, :soldier, {1,7})    
    end
end
  