defmodule Stratego.Game.State do
    defstruct(
        game_state: :initialize,      #red_turn / blue_turn / red_won / blue_won
        blue_team_state: :not_joined, #:placing_pieces, # OR :ready_to_play
        red_team_state: :not_joined   #:placing_pieces, # OR :ready_to_play
        )
end