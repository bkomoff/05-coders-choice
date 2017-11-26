defmodule Stratego.NodeServer do
    def start_link() do
        pid = spawn_link(__MODULE__, :msg_receiver, [])
        :global.register_name(:stratego_node, pid)
    end    

    def msg_receiver() do
        receive do
            { from, :new_game, player } ->
            game = Stratego.Game.new_game(player)
            send from, {:ok, game}

            { from, :place_piece, game, piece, {row, column} } ->
            game = Stratego.Game.place_piece(game, piece, {row, column})
            send from, {:ok, game}            

            { from, :move_piece, game, {row, column}, direction } ->
            game = Stratego.Game.move_piece( game, {row, column}, direction)
            send from, {:ok, game}
        end

        msg_receiver()
    end
end