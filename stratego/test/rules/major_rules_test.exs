defmodule StrategoMajorRulesTest do
    use ExUnit.Case
    doctest Stratego.Rules

    test "Major attacks Captain" do
        result = Stratego.Rules.strike(:major,:captain)
        assert :defender_defeated === result
    end

    test "Major attacks Lieutenant" do
        result = Stratego.Rules.strike(:major,:lieutenant)
        assert :defender_defeated === result
    end

    test "Major attacks Sergeant" do
        result = Stratego.Rules.strike(:major,:sergeant)
        assert :defender_defeated === result
    end

    test "Major attacks Miner" do
        result = Stratego.Rules.strike(:major,:miner)
        assert :defender_defeated === result
    end

    test "Major attacks Scout" do
        result = Stratego.Rules.strike(:major,:scout)
        assert :defender_defeated === result
    end

    test "Major attacks Spy" do
        result = Stratego.Rules.strike(:major,:spy)
        assert :defender_defeated === result
    end
end