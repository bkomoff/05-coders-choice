defmodule Stratego.Squares do
    def start_link( {row, column} ) do
        Agent.start_link( fn -> %{piece: :empty, controlled_by: :no_one} end, name: square_name({row,column}) )
    end

    # If I have time I should do a check to see if valid square and return a :invalid_square if
    # outside of board is entered.
    def place_piece( player, piece, {row, column} ) do
        valid_piece?(piece)
        |> update_square(piece, player, square_name({row,column}))
    end

    def move_piece( player, {row, column}, direction) when direction in [:up] do
        #Check if move is valid
        #Check to see if the square it is moving to is occupied
        #if so then see what battle outcome will be
        #Update current square to piece: :empty, controlled_by: :no_one
        #Update new position with piece; could be your piece or opponents piece
    end

    def move_piece( player, {row, column}, direction) when direction in [:left] do
    end

    def move_piece( player, {row, column}, direction) when direction in [:right] do
    end

    def get_square({row, column}) do
        Agent.get( square_name({row,column}), fn square -> square end )
    end

    defp square_name({row, column}) do
        String.to_atom("Row#{row},Col#{column}")
    end

    defp update_square( :valid_piece, piece, player, square ) do
        Agent.update( square, fn s -> %{ piece: piece, controlled_by: player }  end )        
    end

    defp update_square( :invalid_piece, piece, _player, _square ) do
        IO.write "%{piece} not valid"
    end


    defp valid_piece?(piece) when piece in [ :general, :marshal, :colonel, 
                                             :major,   :captain, :lieutenant,
                                             :sergeant,:miner,   :scout,
                                             :spy,     :bomb,    :flag] do
        :valid_piece                                             
    end

    defp valid_piece?(piece) do
        :invalid_piece
    end
end