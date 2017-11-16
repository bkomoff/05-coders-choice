defmodule Stratego.Board.State do
    defstruct(
        game_state: :initialize,
        turn:       :human #or :ai
    )
end