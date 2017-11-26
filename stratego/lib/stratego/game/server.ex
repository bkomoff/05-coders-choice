defmodule Stratego.Game.Server do
    use GenServer

    @name {:global, __MODULE__}

    def start_link() do
      GenServer.start_link(__MODULE__, [], name: @name)
    end

    def new_game(player) do
        GenServer.call(@name, {:new_game, player})
    end

    def view_board() do
        GenServer.call(@name, :view_board)
    end

    def game_state() do
        GenServer.call(@name, :game_state)
    end

    def retrieve_piece_list() do
        GenServer.call(@name, :retrieve_piece_list)
    end

    def place_piece(game, piece, {row, column}) do
        GenServer.call(@name, {:place_piece, game, piece, {row, column}})
    end

    def move_piece(game, {row, column}, direction) do
        GenServer.call(@name, {:move_piece, game, {row, column}, direction})
    end

    def init() do
      {:ok, Stratego.Game.new_game()}
    end

    def handle_call(:new_game, player, _from, _state) do
      game = Stratego.Game.new_game(player)
      { :reply, game, game }
    end

    def handle_call(:game_state, _from, state) do
      { :reply, Stratego.Game.game_state(state), state }
    end

    def handle_call(:retrieve_pieces_list, _from, state) do
        { :reply, Stratego.Game.retrieve_pieces_list(state), state }
      end
  
    def handle_call(:view_board, _from, state) do
      { :reply, Stratego.Game.view_board(), state }
    end

    def handle_call({:place_piece, game, piece, {row, column}}, _from, state) do
        updated_game = Stratego.Game.place_piece(game, piece, {row, column})
        { :reply, updated_game, state }
    end

    def handle_call({:move_piece, game, {row, column}, direction}, _from, state) do
        updated_board = Stratego.Game.move_piece(game, {row, column}, direction)
        { :reply, updated_board, state }
    end
end