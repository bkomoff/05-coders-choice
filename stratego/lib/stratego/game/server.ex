defmodule Stratego.Game.Server do
    use GenServer

    def start_link() do
        GenServer.start_link(__MODULE__, [], name: __MODULE__)
    end

    def handle_call(:new_game, player, _from, state) do
      game = Stratego.Game.new_game(player)
      { :reply, game, state }
    end

    def handle_call(:view_board, _from, state) do
      { :reply, Stratego.Game.view_board(), state }
    end
    

    def handle_call({:place_piece, player, piece, {column, row}}, _from, state) do
        updated_game = Stratego.Game.place_piece(player, piece, {column, row})
        { :reply, updated_game, state }
    end

    def handle_call({:move_piece, player, {column, row}, direction}, _from, state) do
        updated_board = Stratego.Game.move_piece(player, {column, row}, direction)
        { :reply, updated_board, state }
    end
    
    
end