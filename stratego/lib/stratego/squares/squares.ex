defmodule Stratego.Squares do
    def start_link( {row, column} ) do
        Agent.start_link( fn -> %{piece: :empty} end, name: square_name({row,column}) )
    end

    def place_piece( piece, {row, column} ) when piece in [:general, :marshal, :colonel, 
                                                           :major,   :captain, :lieutenant,
                                                           :sergeant,:miner,   :scout,
                                                           :spy,     :bomb,    :flag] do
        Agent.update( square_name({row,column}), fn _s -> %{ piece: piece }  end )
    end

    def place_piece( _piece, {_row, _column} )  do
        :invalid_piece
    end

    def get_square({row, column}) do
        Agent.get( square_name({row,column}), fn square -> square end )
    end

    defp square_name({row, column}) do
        String.to_atom("Row#{row},Col#{column}")
    end

end