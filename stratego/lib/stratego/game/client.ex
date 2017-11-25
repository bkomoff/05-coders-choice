defmodule Stratego.Game.Client do
    
    @server Stratego.Game.Server

    def new_game(player) do
        GenServer.call(@server, {:new_game, player})
    end

    def view_board() do
        GenServer.call(@server, :view_board)
    end

    def game_state() do
        GenServer.call(@server, :game_state)
    end

    def retrieve_piece_list() do
        GenServer.call(@server, :retrieve_piece_list)
    end

    def place_piece(game, piece, {row, column}) do
        GenServer.call(@server, {:place_piece, game, piece, {row, column}})
    end

    def move_piece(game, {row, column}, direction) do
        GenServer.call(@server, {:move_piece, game, {row, column}, direction})
    end
end