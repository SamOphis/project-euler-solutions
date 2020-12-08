# Find the sum of all multiples of 3 or 5 below 1000

defmodule P001 do
  def sum(1000, state), do: state
  def sum(value, state) when rem(value, 3) == 0, do: sum(value + 1, state + value)
  def sum(value, state) when rem(value, 5) == 0, do: sum(value + 1, state + value)
  def sum(value, state), do: sum(value + 1, state)
end

IO.puts P001.sum(3, 0)
