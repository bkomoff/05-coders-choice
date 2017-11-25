defmodule Stratego.Board do

    def print_board() do
        for row <- 10..1, do: print_col(row)
    end    

    defp print_col(row) do
        for col <- 1..10, do: print_square(row,col)
        IO.puts "\n"
    end

    #Only print square that is either empty or owned by you everything else is a ?
    defp print_square(row,col) do
        Stratego.Squares.get_square({row,col})
        |> convert_for_display
        |> IO.write
    end

    defp convert_for_display(square_state) do
        case square_state do
            %{ piece: :empty } -> " O "
            %{ piece: :marshal } -> " M "
            %{ piece: :general } -> " G "
            %{ piece: :colonel } -> " Co "
            %{ piece: :major } -> " M "
            %{ piece: :captain } -> " Ca "
            %{ piece: :lieutenant } -> " L "
            %{ piece: :sergeant } -> " Se "
            %{ piece: :miner } -> " M "
            %{ piece: :scout } -> " Sc "
            %{ piece: :spy } -> " Sp "
            %{ piece: :bomb } -> " B "
            %{ piece: :flag } -> " F "
        end
    end
end