defmodule Question do

    # 1
    def enumFromTo(first, last) do 
        if first == last do [first]
        else [first] ++ enumFromTo(first+1,last)
        end
    end

    # 2
    def enumFromThenTo(first,next,last) do
        acc = next - first
        
        if first > last do []
        else [first] ++ enumFromThenTo(first+acc, next+acc, last)
        end
    end

    # 3
    def concat([],[]) do [] end
    def concat([],list) do list end
    def concat(list,[]) do list end
    # def concat(a, b) do a ++ b end
    def concat([head | tail], list) do 
        [head] ++ concat(tail,list) 
    end

    # 4
    def index(_,[]) do [] end
    def index(0, [head | _ ]) do head end
    def index(n, [ _ | tail]) do index(n-1, tail) end
    

    # 5
    def reverse([]) do [] end
    def reverse([head | tail]) do
        reverse(tail) ++ [head]
    end
    
end