defmodule Stratego.Squares.Supervisor do
    use Supervisor

    def start_link() do
        Supervisor.start_link( __MODULE__, :no_args, name: __MODULE__ )
    end

    def init( :no_args ) do
        children = 
            for x <- squares() do
              worker( Stratego.Squares, [x], id: x )
            end

        supervise( children, strategy: :one_for_one )
    end

    def squares() do
        for row <- 1..10, column <- 1..10, do: {row, column}        
    end
end