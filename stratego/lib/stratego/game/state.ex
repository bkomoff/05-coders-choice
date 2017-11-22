defmodule Stratego.Game.State do
    defstruct(
        game_state: :initialize, #red_turn / blue_turn / red_won / blue_won
        team: :blue, # or :red
        red_pieces: [], # not sure if this is neccessary to keep track of pieces on board
        blue_pieces: [] # not sure if this is neccessary to keep track of pieces on board
    )
end