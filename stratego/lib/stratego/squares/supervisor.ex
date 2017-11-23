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

    defp squares() do
        for column <- 10..1, row <- 1..10, do: {column,row}        
    end
end