defmodule StrategoTest do
  use ExUnit.Case
  doctest Stratego

  test "greets the world" do
    assert Stratego.hello() == :world
  end
end
