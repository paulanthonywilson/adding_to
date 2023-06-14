defmodule AddingTo do
  @moduledoc """
  The top level problem
  """

  alias AddingTo.{Calculator, Combiner}

  @doc """
  The problem is:

  Insert + or - signs anywhere between the digits 123456789 in such a way that the expression evaluates to
  100. The order of the digits must not be changed.

  Sample solution: 1 + 2 + 3 - 4 + 5 + 6 + 78 + 9 = 100

  """
  @spec plus_minus_range_match(Range.t(), integer) :: list(String.t())
  def plus_minus_range_match(range \\ 1..9, match_me \\ 100) do
    range
    |> Combiner.all_number_combinations()
    |> Enum.map(fn combination ->
      Calculator.add_subtract(combination)
    end)
    |> List.flatten()
    |> Enum.filter(fn {_, calculation} ->
      calculation == match_me
    end)
    |> Enum.map(fn {description, _} ->
      description
    end)
  end
end
