defmodule Ping do
    def start do
        await(0)
    end
    
    def await(count) do
        receive do
            {:pong , pid} -> Process.send(pid, {:ping, self}, [])
        end
        IO.puts "Pong received a ping #{count + 1} times"
        await(count + 1)
    end
end