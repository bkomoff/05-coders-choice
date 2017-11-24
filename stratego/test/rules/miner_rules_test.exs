defmodule StrategoMinerRulesTest do
    use ExUnit.Case
    doctest Stratego.Rules

    test "Miner attacks Scout" do
        result = Stratego.Rules.strike(:miner,:scout)
        assert :defender_defeated === result
    end

    test "Miner attacks Spy" do
        result = Stratego.Rules.strike(:miner,:spy)
        assert :defender_defeated === result
    end

    test "Miner attacks Bomb" do
        result = Stratego.Rules.strike(:miner,:bomb)
        assert :defender_defeated === result
    end
end