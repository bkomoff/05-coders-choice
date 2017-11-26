defmodule Stratego.Game.Server do
    use GenServer

    @name StrategoServer

    def start_link() do
      GenServer.start_link(__MODULE__, %Stratego.Game.State{}, name: @name)
    end

    def new_game(player) do
        GenServer.call(@name, {:new_game, player})
    end

    def view_board() do
        GenServer.call(@name, :view_board)
    end

    def game_state() do
        GenServer.call(@name, {:game_state})
    end

    def place_piece(player, piece, {row, column}) do
        GenServer.call(@name, {:place_piece, player, piece, {row, column}})
    end

    def move_piece(game, {row, column}, direction) do
        GenServer.call(@name, {:move_piece, game, {row, column}, direction})
    end

    #Callbacks

    def handle_call({:new_game, player}, _from, state) do
      game = Stratego.Game.new_game(state, player)
      { :reply, game, game }
    end

    def handle_call({:game_state}, _from, state) do
      { :reply, state, state }
    end
  
    def handle_call(:view_board, _from, state) do
      { :reply, Stratego.Game.view_board(), state }
    end

    def handle_call({:place_piece, player, piece, {row, column}}, _from, state) do
        updated_game = Stratego.Game.place_piece(player, piece, {row, column})
        { :reply, updated_game, state }
    end

    def handle_call({:move_piece, game, {row, column}, direction}, _from, state) do
        state = Stratego.Game.move_piece(game, {row, column}, direction)
        { :reply, state, state }
    end
end