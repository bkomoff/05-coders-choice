defmodule Stratego.Board do

    def print_board() do
        for col <- 10..1, do: print_row(col)
    end    

    defp print_row(col) do
        for row <- 1..10, do: print_square(col,row)
        IO.puts "\n"
    end

    #Only print square that is either empty or owned by you everything else is a ?
    defp print_square(col,row) do
        Stratego.Squares.get_square({col,row})
        |> convert_for_display
        |> IO.write
    end

    defp convert_for_display(square_state) do
        case square_state do
            %{ piece: :empty } -> " O "
            %{ piece: :marshal } -> " M "
            %{ piece: :general } -> " G "
            %{ piece: :colonel } -> " C "
            %{ piece: :major } -> " M "
            %{ piece: :captain } -> " C "
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