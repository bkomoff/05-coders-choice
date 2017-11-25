defmodule Stratego.Rules do

    def strike(attacker_piece, defender_piece) when attacker_piece in [:miner] and defender_piece in [:bomb] do
        :defender_defeated
    end

    def strike(_, defender_piece) when defender_piece in [:bomb] do
        :attacker_defeated
    end

    def strike(attacker_piece, defender_piece) when attacker_piece in [:spy] and defender_piece in [:marshal] do
        :defender_defeated
    end

    def strike(_, defender_piece) when defender_piece in [:marshal] do
        :attacker_defeated
    end

    def strike(attacker_piece, defender_piece) when attacker_piece in [:marshal] and defender_piece in [:general] do
        :defender_defeated
    end

    def strike(_, defender_piece) when defender_piece in [:general] do
        :attacker_defeated
    end
    
    def strike(attacker_piece, defender_piece) when attacker_piece in [:marshal, :general] and defender_piece in [:colonel] do
        :defender_defeated
    end

    def strike(_, defender_piece) when defender_piece in [:colonel] do
        :attacker_defeated
    end

    def strike(attacker_piece, defender_piece) when attacker_piece in [:marshal, :general, :colonel] and defender_piece in [:major] do
        :defender_defeated
    end

    def strike(_, defender_piece) when defender_piece in [:major] do
        :attacker_defeated
    end

    def strike(attacker_piece, defender_piece) when attacker_piece in [:marshal, :general, :colonel] and defender_piece in [:major] do
        :defender_defeated
    end

    def strike(_, defender_piece) when defender_piece in [:major] do
        :attacker_defeated
    end

    def strike(attacker_piece, defender_piece) when attacker_piece in [:marshal, :general, :colonel, 
                                                                       :major] and defender_piece in [:captain] do
        :defender_defeated
    end

    def strike(_, defender_piece) when defender_piece in [:captain] do
        :attacker_defeated
    end

    def strike(attacker_piece, defender_piece) when attacker_piece in [:marshal, :general, :colonel, 
                                                                       :major, :captain] and defender_piece in [:lieutenant] do
        :defender_defeated
    end

    def strike(_, defender_piece) when defender_piece in [:lieutenant] do
        :attacker_defeated
    end

    def strike(attacker_piece, defender_piece) when attacker_piece in [:marshal, :general, :colonel, 
                                                                       :major, :captain, :lieutenant] and defender_piece in [:sergeant] do
        :defender_defeated
    end

    def strike(_, defender_piece) when defender_piece in [:sergeant] do
        :attacker_defeated
    end

    def strike(attacker_piece, defender_piece) when attacker_piece in [:marshal, :general, :colonel,
                                                                       :major, :captain, :lieutenant, :sergeant] and defender_piece in [:miner] do
        :defender_defeated
    end

    def strike(_, defender_piece) when defender_piece in [:miner] do
        :attacker_defeated
    end

    def strike(attacker_piece, defender_piece) when attacker_piece in [:marshal, :general, :colonel,
                                                                       :major, :captain, :lieutenant, 
                                                                       :sergeant, :miner] and defender_piece in [:scout] do
        :defender_defeated
    end

    def strike(_, defender_piece) when defender_piece in [:scout] do
        :attacker_defeated
    end
    
    def strike(attacker_piece, defender_piece) when attacker_piece in [:marshal, :general, :colonel,
                                                                       :major, :captain, :lieutenant, 
                                                                       :sergeant, :miner, :scout] and defender_piece in [:spy] do
        :defender_defeated
    end

    def strike(_, defender_piece) when defender_piece in [:spy] do
        :attacker_defeated
    end

    def strike(_, defender_piece) when defender_piece in [:flag] do
        :flag_captured
    end
end