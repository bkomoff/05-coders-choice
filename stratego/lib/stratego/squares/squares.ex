defmodule Stratego.Squares do
    def start_link( {row, column} ) do
        Agent.start_link( fn -> empty_square() end, name: square_name({row, column}) )
    end

    def place_piece( player, piece, {row, column} ) when piece in [ :general, :marshal, :colonel, 
                                                                    :major,   :captain, :lieutenant,
                                                                    :sergeant,:miner,   :scout,
                                                                    :spy,     :bomb,    :flag ] do
        update_square(piece, player, square_name({row, column}))
    end

    def place_piece( _, _, _ ) do
        :invalid_piece
    end

    def move_piece( player, {row, column}, direction) when direction in [:up] do
        from_square = get_square({row,column})
        piece = Map.get(from_square, :piece)

        update_square( piece, player, square_name{row + 1, column})

        update_square( :empty, :no_one, square_name{row, column})     
        
    end

    def move_piece( player, {row, column}, direction) when direction in [:left] do
        from_square = get_square({row,column})
        piece = Map.get(from_square, :piece)
        
        update_square( piece, player, square_name{row, column - 1})
        
        update_square( :empty, :no_one, square_name{row, column})     
    end

    def move_piece( player, {row, column}, direction) when direction in [:right] do
        from_square = get_square({row,column})
        piece = Map.get(from_square, :piece)

        update_square( piece, player, square_name{row, column + 1})

        update_square( :empty, :no_one, square_name{row, column})     
    end

    def move_piece( player, {row, column}, direction) when direction in [:down] do
        from_square = get_square({row,column})
        piece = Map.get(from_square, :piece)
        
        update_square( piece, player, square_name{row - 1, column})
        
        update_square( :empty, :no_one, square_name{row, column})     
    end

    def get_square({row, column}) do
        Agent.get( square_name({row, column}), fn square -> square end )
    end

    defp square_name({row, column}) do
        String.to_atom("Row#{row},Col#{column}")
    end

    defp update_square( piece, player, square ) do
        Agent.update( square, fn s -> %{ piece: piece, controlled_by: player }  end )        
    end

    defp empty_square() do
        %{piece: :empty, controlled_by: :no_one}
    end
end