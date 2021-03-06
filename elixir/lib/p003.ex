# Largest prime factor of 600851475143
# We will use Pollard's ρ integer factorisation algorithm.
# Much faster algorithms exist (like the quadratic sieve), but they are significantly harder to implement.

defmodule P003 do
  @moduledoc false

  defp g(x, number), do: rem(x * x + 1, number)

  defp inner(1, x, y, number) do
    x = g(x, number)
    y = g(y, number)
      |> g(number)

    x - y
      |> Integer.gcd(number)
      |> inner(x, y, number)
  end

  defp inner(divisor, _, _, number) when divisor == number,
    do: {:prime, number}

  defp inner(divisor, _, _, _),
    do: {:composite, divisor}

  defp inner(number),
    do: inner(1, 2, 2, number)

  defp start(number, divisor) do
    value = div(number, divisor)

    case inner(value) do
      {:composite, divisor} -> start(value, divisor)
      prime -> prime
    end
  end

  def start(number),
    do: start(number, 1)
end

# IO.inspect P003.start(600_851_475_143), label: "Largest prime factor"
