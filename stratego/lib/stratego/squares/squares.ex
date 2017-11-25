defmodule Stratego.Squares do

    def start_link( {row, column} ) do
        Agent.start_link( fn -> empty_square() end, name: square_name({row, column}) )
    end

    def place_piece( player, piece, {row, column} ) do
        piece
        |> valid_piece?
        |> update_square(piece, player, square_name({row, column}))
    end

    def move_piece( player, from, to ) do
        from_square = get_square(from)
        piece = Map.get(from_square, :piece)

        #Update square piece is going to
        update_square(:valid_piece, piece, player, square_name(to))

        #Update square piece came from
        update_square(:valid_piece, :empty, :no_one, square_name(from))
    end

    def get_square({row, column}) do
        Agent.get( square_name({row, column}), fn square -> square end )
    end

    defp square_name({row, column}) do
        String.to_atom("Row#{row},Col#{column}")
    end

    defp valid_piece?(piece) when piece in [ :general, :marshal, :colonel, 
                                             :major,   :captain, :lieutenant,
                                             :sergeant,:miner,   :scout,
                                             :spy,     :bomb,    :flag ] do
        :valid_piece
    end

    defp valid_piece?(_) do
        :invalid_piece 
    end

    defp update_square( :valid_piece, piece, player, square ) do
        Agent.update( square, fn s -> %{ piece: piece, controlled_by: player }  end )        
        :piece_accepted
    end

    defp update_square( :invalid_piece, _piece, _player, _square ) do
        :piece_rejected
    end
    
    defp empty_square() do
        %{piece: :empty, controlled_by: :no_one}
    end
end