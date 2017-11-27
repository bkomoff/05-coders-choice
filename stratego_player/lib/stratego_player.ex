defmodule StrategoPlayer do
  defdelegate connect(node_name),                      to: StrategoPlayer.Impl
  defdelegate play(player),                            to: StrategoPlayer.Impl
  defdelegate player_ready(player),                    to: StrategoPlayer.Impl
  defdelegate place_piece(player, piece, row, column), to: StrategoPlayer.Impl
  defdelegate move_piece(row, column, direction),      to: StrategoPlayer.Impl
  defdelegate game_state(),                            to: StrategoPlayer.Impl
  defdelegate get_square(row,column),                  to: StrategoPlayer.Impl
end
