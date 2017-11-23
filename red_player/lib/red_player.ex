defmodule RedPlayer do
  defdelegate play(), to: RedPlayer.Impl
end
