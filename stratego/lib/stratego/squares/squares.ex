defmodule Stratego.Squares do
    def start_link( {row, column} ) do
        Agent.start_link( fn -> %{piece: :empty} end, name: square_name({row,column}) )
    end

    def place_piece( piece, {row, column} ) do
        #Need to check if it is one of the correct pieces
        Agent.update( square_name({row,column}), fn _s -> %{ piece: piece }  end )
    end
    
    def get_square({row, column}) do
        Agent.get( square_name({row,column}), fn square -> square end )
    end

    defp square_name( {row, column} ) do
        String.to_atom("Row#{row},Col#{column}")
    end

end