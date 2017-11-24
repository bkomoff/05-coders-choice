defmodule StrategoLieutenantRulesTest do
    use ExUnit.Case
    doctest Stratego.Rules

    test "Lieutenant attacks Sergeant" do
        result = Stratego.Rules.strike(:lieutenant,:sergeant)
        assert :defender_defeated === result
    end

    test "Lieutenant attacks Miner" do
        result = Stratego.Rules.strike(:lieutenant,:miner)
        assert :defender_defeated === result
    end

    test "Lieutenant attacks Scout" do
        result = Stratego.Rules.strike(:lieutenant,:scout)
        assert :defender_defeated === result
    end

    test "Lieutenant attacks Spy" do
        result = Stratego.Rules.strike(:lieutenant,:spy)
        assert :defender_defeated === result
    end
end