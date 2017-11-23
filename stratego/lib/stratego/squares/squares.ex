defmodule Stratego.Squares do
    def start_link( {column, row} ) do
        Agent.start_link( fn -> %{piece: :empty, controlled_by: :no_one} end, name: square_name({column, row}) )
    end

    def place_piece( player, piece, {column, row} ) do
        valid_piece?(piece)
        |> update_square(piece, player, square_name({column, row}))
    end

    def move_piece( player, {column, row}, direction) when direction in [:up] do
        valid_move?({column,row + 1})
        #Check to see if the square it is moving to is occupied
        #if so then see what battle outcome will be
        #Update current square to piece: :empty, controlled_by: :no_one
        #Update new position with piece; could be your piece or opponents piece
    end

    # def move_piece( player, {column, row}, direction) when direction in [:left] do
    # end

    # def move_piece( player, {column, row}, direction) when direction in [:right] do
    # end

    # def move_piece( player, {column, row}, direction) when direction in [:down] do
    # end

    def get_square({column, row}) do
        Agent.get( square_name({column, row}), fn square -> square end )
    end

    defp square_name({column, row}) do
        String.to_atom("Col#{column},Row#{row}")
    end

    defp update_square( :valid_piece, piece, player, square ) do
        Agent.update( square, fn s -> %{ piece: piece, controlled_by: player }  end )        
    end

    defp update_square( _,_,_,_) do
        
    end

    defp valid_piece?(piece) when piece in [ :general, :marshal, :colonel, 
                                             :major,   :captain, :lieutenant,
                                             :sergeant,:miner,   :scout,
                                             :spy,     :bomb,    :flag] do
        :valid_piece                                             
    end

    defp valid_piece?(_piece) do
        :invalid_piece
    end

    defp valid_move?({column,row}) when is_integer(row) and (row >= 1 and row <= 10) and (is_integer(column) and (column >= 1 and column <= 10)) do
        :valid_move
    end

    defp valid_move?({_column,_row}) do
        :invalid_move
    end

    defp square_occupied?(square = %{piece: :empty}) do
        :not_occupied
    end    
end