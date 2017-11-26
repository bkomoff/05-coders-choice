defmodule Stratego.NodeServer do
    def start_link() do
        pid = spawn_link(__MODULE__, :msg_receiver, [])
        :global.register_name(:stratego_node, pid)
    end    

    def msg_receiver() do
        receive do
            { from, :new_game, player } ->
            game = Stratego.Game.Server.new_game( player)
            send from, {:ok, game}

            { from, :game_state } ->
            game = Stratego.Game.Server.game_state()
            send from, {:ok, game}

            { from, :place_piece, player, piece, {row, column} } ->
            game = Stratego.Game.Server.place_piece( player, piece, {row, column})
            send from, {:ok, game}            

            { from, :move_piece, game, {row, column}, direction } ->
            game = Stratego.Game.Server.move_piece( game, {row, column}, direction)
            send from, {:ok, game}
        end

        msg_receiver()
    end
end