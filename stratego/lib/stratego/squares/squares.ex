defmodule Stratego.Squares do
    def start_link( {column, row} ) do
        Agent.start_link( fn -> empty_square() end, name: square_name({column, row}) )
    end

    def place_piece( player, piece, {column, row} ) when piece in [ :general, :marshal, :colonel, 
                                                                    :major,   :captain, :lieutenant,
                                                                    :sergeant,:miner,   :scout,
                                                                    :spy,     :bomb,    :flag] do
        update_square(piece, player, square_name({column, row}))
    end

    def place_piece( _player, piece, {column, row} ) when piece in [:empty] do
        update_square( :empty, :no_one, square_name({column, row}))
    end

    def place_piece( _, _, _ ) do
        :invalid_piece
    end

    def move_piece( player, {column, row}, direction) when direction in [:up] do
        from_square = get_square({column,row})
        piece = Map.get(from_square, :piece)
        update_square( piece, player, square_name{column+1,row})
        update_square( :empty, :no_one, square_name{column,row})     
    end

    def move_piece( player, {column, row}, direction) when direction in [:left] do
        from_square = get_square({column,row})
        piece = Map.get(from_square, :piece)
        update_square( piece, player, square_name{column,row-1})
        update_square( :empty, :no_one, square_name{column,row})     
    end

    def move_piece( player, {column, row}, direction) when direction in [:right] do
        from_square = get_square({column,row})
        piece = Map.get(from_square, :piece)
        update_square( piece, player, square_name{column,row+1})
        update_square( :empty, :no_one, square_name{column,row})     
    end

    def move_piece( player, {column, row}, direction) when direction in [:down] do
        from_square = get_square({column,row})
        piece = Map.get(from_square, :piece)
        update_square( piece, player, square_name{column-1,row})
        update_square( :empty, :no_one, square_name{column,row})     
    end

    def get_square({column, row}) do
        Agent.get( square_name({column, row}), fn square -> square end )
    end

    defp square_name({column, row}) do
        String.to_atom("Col#{column},Row#{row}")
    end

    defp update_square( piece, player, square ) do
        Agent.update( square, fn s -> %{ piece: piece, controlled_by: player }  end )        
    end

    defp empty_square() do
        %{piece: :empty, controlled_by: :no_one}
    end
end