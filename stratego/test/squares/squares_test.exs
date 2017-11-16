defmodule StrategoSqauresTest do
    use ExUnit.Case
    doctest Stratego.Squares
  
    test "Verify all valid pieces have been placed" do
        Stratego.Squares.place_piece(:marshal, {1,7})
        assert %{piece: :marshal} === Stratego.Squares.get_square({1,7})

        Stratego.Squares.place_piece(:general, {2,7})
        assert %{piece: :general} === Stratego.Squares.get_square({2,7})

        Stratego.Squares.place_piece(:colonel, {3,7})
        assert %{piece: :colonel} === Stratego.Squares.get_square({3,7})

        Stratego.Squares.place_piece(:major, {4,7})
        assert %{piece: :major} === Stratego.Squares.get_square({4,7})

        Stratego.Squares.place_piece(:captain, {5,7})
        assert %{piece: :captain} === Stratego.Squares.get_square({5,7})

        Stratego.Squares.place_piece(:lieutenant, {6,7})
        assert %{piece: :lieutenant} === Stratego.Squares.get_square({6,7})

        Stratego.Squares.place_piece(:sergeant, {7,7})
        assert %{piece: :sergeant} === Stratego.Squares.get_square({7,7})

        Stratego.Squares.place_piece(:miner, {8,7})
        assert %{piece: :miner} === Stratego.Squares.get_square({8,7})

        Stratego.Squares.place_piece(:scout, {9,7})
        assert %{piece: :scout} === Stratego.Squares.get_square({9,7})

        Stratego.Squares.place_piece(:spy, {10,7})
        assert %{piece: :spy} === Stratego.Squares.get_square({10,7})

        Stratego.Squares.place_piece(:bomb, {1,8})
        assert %{piece: :bomb} === Stratego.Squares.get_square({1,8})

        Stratego.Squares.place_piece(:flag, {2,8})
        assert %{piece: :flag} === Stratego.Squares.get_square({2,8})
    end

    test "Verify that invalid piece cannot be placed" do
        assert :invalid_piece === Stratego.Squares.place_piece(:soldier, {1,7})    
    end
end
  