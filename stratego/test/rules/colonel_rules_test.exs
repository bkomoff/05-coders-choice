defmodule StrategoColonelRulesTest do
    use ExUnit.Case
    doctest Stratego.Rules

    test "Colonel attacks Major" do
        result = Stratego.Rules.strike(:colonel,:major)
        assert :defender_defeated === result
    end

    test "Colonel attacks Captain" do
        result = Stratego.Rules.strike(:colonel,:captain)
        assert :defender_defeated === result
    end

    test "Colonel attacks Lieutenant" do
        result = Stratego.Rules.strike(:colonel,:lieutenant)
        assert :defender_defeated === result
    end

    test "Colonel attacks Sergeant" do
        result = Stratego.Rules.strike(:colonel,:sergeant)
        assert :defender_defeated === result
    end

    test "Colonel attacks Miner" do
        result = Stratego.Rules.strike(:colonel,:miner)
        assert :defender_defeated === result
    end

    test "Colonel attacks Scout" do
        result = Stratego.Rules.strike(:colonel,:scout)
        assert :defender_defeated === result
    end

    test "Colonel attacks Spy" do
        result = Stratego.Rules.strike(:colonel,:spy)
        assert :defender_defeated === result
    end
end