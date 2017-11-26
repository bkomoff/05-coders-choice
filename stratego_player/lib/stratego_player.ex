defmodule StrategoPlayer do
  defdelegate connect(node_name), to: StrategoPlayer.Impl
end
