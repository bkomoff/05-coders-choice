defmodule Stratego.Game.Server do
    use GenServer

    @name StrategoServer

    def start_link() do
      GenServer.start_link(__MODULE__, %Stratego.Game.State{}, name: @name)
    end

    def new_game(player) do
        GenServer.call(@name, {:new_game, player})
    end

    def player_ready(player) do
        GenServer.call(@name, {:player_ready, player})
    end

    def get_square({row,column}) do
        GenServer.call(@name, {:get_square, {row, column}})
    end

    def game_state() do
        GenServer.call(@name, {:game_state})
    end

    def place_piece(player, piece, {row, column}) do
        GenServer.call(@name, {:place_piece, player, piece, {row, column}})
    end

    def move_piece({row, column}, direction) do
        GenServer.call(@name, {:move_piece, {row, column}, direction})
    end

    #Callbacks

    def handle_call({:new_game, player}, _from, state) do
      updated_state = Stratego.Game.new_game(state, player)
      { :reply, updated_state, updated_state }
    end

    def handle_call({:game_state}, _from, state) do
      { :reply, Stratego.Game.game_state(state), state }
    end

    def handle_call({:player_ready, player}, _from, state) do
      update_state = Stratego.Game.player_ready(state, player)
      { :reply, update_state, update_state }
    end

    def handle_call({:get_square, {row, column}}, _from, state) do
      { :reply, Stratego.Game.get_square({row, column}), state }
    end

    def handle_call({:place_piece, player, piece, {row, column}}, _from, state) do
        updated_game = Stratego.Game.place_piece(player, piece, {row, column})
        { :reply, updated_game, state }
    end

    def handle_call({:move_piece, {row, column}, direction}, _from, state) do
        updated_board = Stratego.Game.move_piece(state, {row, column}, direction)
        { :reply, updated_board, state }
    end
end