defmodule StrategoPlayer.Impl do
    def connect(game_node) do
        Node.connect(game_node)
        :global.sync()
    end

    def send_to_game(args) do
        send :global.whereis_name(:stratego_node), [self() | args ] |> List.to_tuple

        receive do
            {:ok, result} -> result
        end
    end

    def play(player) do
        send_to_game([:new_game, player])
    end

    def player_ready(player) do
        send_to_game([:player_ready, player])
    end

    def place_piece( player, piece, {row,column}) do
        send_to_game([:place_piece, player, piece, {row,column}])
    end

    def get_square({row,column}) do
        send_to_game([:get_square, {row,column}])
    end

    def move_piece({row,column}, direction) do
        send_to_game([:move_piece, {row,column}, direction])
    end

    def game_state() do
        send_to_game([:game_state])
    end

end