defmodule Stratego.Game.Server do
    use GenServer

    def start_link() do
        GenServer.start_link(__MODULE__, [], name: __MODULE__)
    end

    def handle_call(:new_game, _from, state) do
      game = Stratego.Game.new_game()
      { :reply, self(), game }
    end

    def handle_call(:view_board, _from, state) do
      { :reply, Stratego.Game.view_board(), state }
    end
    

    def handle_call({:place_piece, player, piece, {row, column}}, _from, state) do
        updated_game = Stratego.Game.place_piece(player, piece, {row, column})
        { :reply, updated_game, state }
    end

    def handle_call({:move_piece, player, row, column, direction}, _from, state) do
        updated_board = Stratego.Game.move_piece(player, row, column, direction)
        { :reply, self(), updated_board }
    end
    
    
end