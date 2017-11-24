defmodule StrategoMarshalRulesTest do
    use ExUnit.Case
    doctest Stratego.Rules

    test "Marshal attacks General" do
        result = Stratego.Rules.strike(:marshal,:general)
        assert :defender_defeated === result
    end

    test "Marshal attacks Colonel" do
        result = Stratego.Rules.strike(:marshal,:colonel)
        assert :defender_defeated === result
    end

    test "Marshal attacks Major" do
        result = Stratego.Rules.strike(:marshal,:major)
        assert :defender_defeated === result
    end

    test "Marshal attacks Captain" do
        result = Stratego.Rules.strike(:marshal,:captain)
        assert :defender_defeated === result
    end

    test "Marshal attacks Lieutenant" do
        result = Stratego.Rules.strike(:marshal,:lieutenant)
        assert :defender_defeated === result
    end

    test "Marshal attacks Sergeant" do
        result = Stratego.Rules.strike(:marshal,:sergeant)
        assert :defender_defeated === result
    end

    test "Marshal attacks Miner" do
        result = Stratego.Rules.strike(:marshal,:miner)
        assert :defender_defeated === result
    end

    test "Marshal attacks Scout" do
        result = Stratego.Rules.strike(:marshal,:scout)
        assert :defender_defeated === result
    end

    test "Marshal attacks Spy" do
        result = Stratego.Rules.strike(:marshal,:spy)
        assert :defender_defeated === result
    end
end