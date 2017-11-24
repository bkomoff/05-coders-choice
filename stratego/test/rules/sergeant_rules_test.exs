defmodule StrategoSergeantRulesTest do
    use ExUnit.Case
    doctest Stratego.Rules

    test "Sergeant attacks Miner" do
        result = Stratego.Rules.strike(:sergeant,:miner)
        assert :defender_defeated === result
    end

    test "Sergeant attacks Scout" do
        result = Stratego.Rules.strike(:sergeant,:scout)
        assert :defender_defeated === result
    end

    test "Sergeant attacks Spy" do
        result = Stratego.Rules.strike(:sergeant,:spy)
        assert :defender_defeated === result
    end
end