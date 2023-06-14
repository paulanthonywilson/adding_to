defmodule AddingTo.Combiner do
  @moduledoc """
  Adjacent numbers combiner in a range
  """

  @doc """
  Combines permutations of numbers in a range consisting of adjacent integers, in pairs
  eg
  iex> AddingTo.Combiner.pairs(1..3)
  [[[1, 2], [3]], [[1], [2, 3]]]
  """
  def pairs(range = %Range{}) do
    range
    |> Enum.to_list()
    |> do_pairs()
  end

  @doc """
  All combinations of contiguous numbers in the range as a list of integer lists
  eg
  iex> AddingTo.Combiner.all_combinations(1..3)
  [[[1, 2], [3]], [[1], [2, 3]], [[1], [2], [3]]]
  """
  @spec all_combinations(Range.t()) :: list(list(integer()))
  def all_combinations(range = %Range{}) do
    range
    |> Enum.to_list()
    |> do_all_combinations()
  end

  defp do_all_combinations(elems) do
    pairs = do_pairs(elems)
    do_all_combinations(pairs, pairs)
  end

  defp do_all_combinations([], acc) do
    acc
  end

  defp do_all_combinations([[_ | [[_]]] | t], acc) do
    do_all_combinations(t, acc)
  end

  defp do_all_combinations([[hh | [ht]] | t], acc) do
    ht_combos =
      ht
      |> do_all_combinations()
      |> Enum.map(fn combo ->
        [hh | combo]
      end)

    acc = acc ++ ht_combos

    do_all_combinations(t, acc)
  end

  defp do_pairs(items, acc \\ [])

  defp do_pairs([h | [_] = t], acc) do
    lhs = last_lhs(acc) ++ [h]
    [[lhs, t] | acc]
  end

  defp do_pairs([h | t], acc) do
    lhs = last_lhs(acc) ++ [h]

    do_pairs(t, [[lhs, t] | acc])
  end

  defp do_pairs(_, _), do: []

  defp last_lhs([]), do: []
  defp last_lhs([[lhs | _] | _]), do: lhs

  @doc """
  All combinations of contiguous numbers in the range as a list of integers
  eg
  iex> AddingTo.Combiner.all_number_combinations(1..3)
  [[12, 3], [1, 23], [1, 2, 3]]
  """
  @spec all_number_combinations(Range.t()) :: list(integer())
  def all_number_combinations(range = %Range{}) do
    range
    |> all_combinations()
    |> Enum.map(&combinations_to_numbers/1)
  end

  defp combinations_to_numbers(combination) do
    combination
    |> Enum.map(&num_list_to_number/1)
  end

  defp num_list_to_number(numlist) do
    numlist
    |> Enum.reverse()
    |> Enum.with_index()
    |> Enum.reduce(0, fn {n, i}, sum ->
      sum + n * 10 ** i
    end)
  end
end
