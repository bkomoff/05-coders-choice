defmodule StrategoCaptainRulesTest do
    use ExUnit.Case
    doctest Stratego.Rules

    test "Captain attacks Lieutenant" do
        result = Stratego.Rules.strike(:captain,:lieutenant)
        assert :defender_defeated === result
    end

    test "Captain attacks Sergeant" do
        result = Stratego.Rules.strike(:captain,:sergeant)
        assert :defender_defeated === result
    end

    test "Captain attacks Miner" do
        result = Stratego.Rules.strike(:captain,:miner)
        assert :defender_defeated === result
    end

    test "Captain attacks Scout" do
        result = Stratego.Rules.strike(:captain,:scout)
        assert :defender_defeated === result
    end

    test "Captain attacks Spy" do
        result = Stratego.Rules.strike(:captain,:spy)
        assert :defender_defeated === result
    end
end