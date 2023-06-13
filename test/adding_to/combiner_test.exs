defmodule AddingTo.CombinerTest do
  use ExUnit.Case
  doctest AddingTo.Combiner
  alias AddingTo.Combiner

  test "pairs" do
    assert [] = Combiner.pairs(1..1)
    assert [[[1], [2]]] = Combiner.pairs(1..2)

    assert [
             [[1, 2], [3]],
             [[1], [2, 3]]
           ] == Combiner.pairs(1..3)

    assert [
             [[1, 2, 3], [4]],
             [[1, 2], [3, 4]],
             [[1], [2, 3, 4]]
           ] == Combiner.pairs(1..4)
  end

  describe "all combinations" do
    test "1 and two element ranges" do
      assert [] = Combiner.all_combinations(1..1)
      assert [[[1], [2]]] = Combiner.all_combinations(1..2)
    end

    test "3 element range" do
      assert [
               [[1], [2], [3]],
               [[1], [2, 3]],
               [[1, 2], [3]]
             ] == Combiner.all_combinations(1..3) |> Enum.sort()
    end

    test "4 element range" do
      assert [
               [[1], [2], [3], [4]],
               [[1], [2], [3, 4]],
               [[1], [2, 3], [4]],
               [[1], [2, 3, 4]],
               [[1, 2], [3], [4]],
               [[1, 2], [3, 4]],
               [[1, 2, 3], [4]]
             ] ==
               Combiner.all_combinations(1..4) |> Enum.sort()
    end
  end

  describe "all combinations as base10 numbers" do
    test "4 element range" do
      assert [
               [1, 2, 3, 4],
               [1, 2, 34],
               [1, 23, 4],
               [1, 234],
               [12, 3, 4],
               [12, 34],
               [123, 4]
             ] ==
               Combiner.all_number_combinations(1..4) |> Enum.sort()
    end
  end
end
