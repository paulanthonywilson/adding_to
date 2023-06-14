defmodule AddingTo.Calculator do
  @moduledoc """
  For adding up and subtracting all permutations in a list of numbers
  """

  @doc """
  Perform all combinations of adding and subtracting for the list of integers and
  return a list of the results in the form of a two element tuple: a string represnetation of the
  sum and the result.
  eg
  iex> AddingTo.Calculator.add_subtract([1, 2])
  [{"1 + 2", 3}, {"1 - 2", -1}]

  """
  @spec add_subtract(list(integer())) :: list({description :: String.t(), sum :: integer()})
  def add_subtract([h | t] = elements) when length(elements) > 1 do
    for operations <- plus_minus(elements) do
      operations
      |> Enum.zip(t)
      |> Enum.reduce({to_string(h), h}, fn
        {"0", el}, {description, total} ->
          {"#{description} + #{el}", total + el}

        {"1", el}, {description, total} ->
          {"#{description} - #{el}", total - el}
      end)
    end
  end

  def add_subtract(_), do: []

  defp plus_minus(elements) do
    for i <- 0..(2 ** (length(elements) - 1) - 1) do
      i
      |> Integer.to_string(2)
      |> String.pad_leading(length(elements) - 1, ["0"])
      |> String.codepoints()
    end
  end
end
