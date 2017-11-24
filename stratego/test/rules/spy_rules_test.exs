defmodule StrategoSpyRulesTest do
    use ExUnit.Case
    doctest Stratego.Rules

    test "Spy attacks Marshal" do
        result = Stratego.Rules.strike(:spy,:marshal)
        assert :defender_defeated === result
    end
end