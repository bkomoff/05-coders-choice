defmodule Stratego.Rules do

    @piece_hitpoints %{
        marshal: 1, general: 2, colonel: 3, major: 4, captain: 5, lieutenant: 6, sergeant: 7, miner: 8, scout: 9, spy: 10 }

    def strike(attacker_piece, defender_piece) when attacker_piece in [:miner] and defender_piece in [:bomb] do
        :defender_defeated
    end

    def strike(_, defender_piece) when defender_piece in [:bomb] do
        :attacker_defeated
    end

    def strike(attacker_piece, defender_piece) when attacker_piece in [:spy] and defender_piece in [:marshal] do
        :defender_defeated
    end

    def strike(_, defender_piece) when defender_piece in [:flag] do
        :flag_captured
    end

    def strike(_,:no_one) do
        :empty_space
    end

    def strike(attacker_piece, defender_piece) do
        attacker_hitpoints = Map.get(@piece_hitpoints, attacker_piece)        
        defender_hitpoints = Map.get(@piece_hitpoints, defender_piece)        
        
        strike_outcome( attacker_hitpoints < defender_hitpoints )
    end

    defp strike_outcome(true) do
        :defender_defeated
    end

    defp strike_outcome(false) do
        :attacker_defeated
    end
end