defmodule Stratego.Board do

    @piece_type_to_human %{marshal: " Ma ", general: " G ", colonel: " Co ", major: " Ma ", captain: " C ",
                           lieutenant: " L ", sergeant: " Se ", miner: " Mi ", scout: " Sc ", spy: " Sp ",
                           bomb: " B ", flag: " F "}

    @piece_types Map.keys(@piece_type_to_human)

    def piece_atom_to_string(type), do: Map.get(@piece_type_to_human, type, " O ")
    def piece_atom_to_string(), do: @piece_types

    def print_board() do
        for row <- 10..1, do: print_col(row)
    end    

    defp print_col(row) do
        for col <- 1..10, do: print_square(row,col)
        IO.puts "\n"
    end

    defp print_square(row,col) do
        Map.get(Stratego.Squares.get_square({row,col}), :piece)
        |> piece_atom_to_string
        |> IO.write
    end
end