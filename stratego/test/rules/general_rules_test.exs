defmodule StrategoGeneralRulesTest do
    use ExUnit.Case
    doctest Stratego.Rules

    test "General attacks Colonel" do
        result = Stratego.Rules.strike(:general,:colonel)
        assert :defender_defeated === result
    end

    test "General attacks Major" do
        result = Stratego.Rules.strike(:general,:major)
        assert :defender_defeated === result
    end

    test "General attacks Captain" do
        result = Stratego.Rules.strike(:general,:captain)
        assert :defender_defeated === result
    end

    test "General attacks Lieutenant" do
        result = Stratego.Rules.strike(:general,:lieutenant)
        assert :defender_defeated === result
    end

    test "General attacks Sergeant" do
        result = Stratego.Rules.strike(:general,:sergeant)
        assert :defender_defeated === result
    end

    test "General attacks Miner" do
        result = Stratego.Rules.strike(:general,:miner)
        assert :defender_defeated === result
    end

    test "General attacks Scout" do
        result = Stratego.Rules.strike(:general,:scout)
        assert :defender_defeated === result
    end

    test "General attacks Spy" do
        result = Stratego.Rules.strike(:general,:spy)
        assert :defender_defeated === result
    end
end