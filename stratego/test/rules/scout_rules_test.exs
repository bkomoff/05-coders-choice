defmodule StrategoScoutRulesTest do
    use ExUnit.Case
    doctest Stratego.Rules

    test "Scout attacks Spy" do
        result = Stratego.Rules.strike(:scout,:spy)
        assert :defender_defeated === result
    end
end