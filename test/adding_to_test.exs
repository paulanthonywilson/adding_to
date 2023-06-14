defmodule AddingToTest do
  use ExUnit.Case

  test "plus_minus_range_match" do
    assert ["1 + 2"] == AddingTo.plus_minus_range_match(1..2, 3)
    assert ["1 + 2 + 3"] == AddingTo.plus_minus_range_match(1..3, 6)
    assert ["1 + 2 + 3 + 4 - 5", "1 - 2 - 3 + 4 + 5"] == AddingTo.plus_minus_range_match(1..5, 5)

    assert [] = AddingTo.plus_minus_range_match(1..1, 1)
  end
end
