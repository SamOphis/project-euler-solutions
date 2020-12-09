# Find the sum of all multiples of 3 or 5 below 1000

defmodule P001 do
  @moduledoc false

  defp sum(1000, state), do: state

  defp sum(value, state) when rem(value, 3) == 0,
    do: sum(value + 1, state + value)

  defp sum(value, state) when rem(value, 5) == 0,
    do: sum(value + 1, state + value)

  defp sum(value, state),
    do: sum(value + 1, state)
  def sum,
    do: sum(3, 0)
end

# IO.inspect P001.sum, label: "Sum"
