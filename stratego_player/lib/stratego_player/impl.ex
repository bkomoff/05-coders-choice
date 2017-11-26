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

    def place_piece( game, piece, {row,column}) do
        send_to_game([:place_piece, game, piece, {row,column}])
    end

    def move_piece( game, {row,column}, direction) do
        send_to_game([:move_piece, game, {row,column}, direction])
    end

end