defmodule AddingTo.CalculatorTest do
  use ExUnit.Case

  alias AddingTo.Calculator
  doctest Calculator

  test "add_subtract" do
    assert [
             {"1 + 2", 1 + 2},
             {"1 - 2", 1 - 2}
           ] == Calculator.add_subtract([1, 2])

    assert [
             {"1 + 2 + 3", 1 + 2 + 3},
             {"1 + 2 - 3", 1 + 2 - 3},
             {"1 - 2 + 3", 1 - 2 + 3},
             {"1 - 2 - 3", 1 - 2 - 3}
           ] == Calculator.add_subtract([1, 2, 3])

    assert [
             {"1 + 2 + 3 + 4", 1 + 2 + 3 + 4},
             {"1 + 2 + 3 - 4", 1 + 2 + 3 - 4},
             {"1 + 2 - 3 + 4", 1 + 2 - 3 + 4},
             {"1 + 2 - 3 - 4", 1 + 2 - 3 - 4},
             {"1 - 2 + 3 + 4", 1 - 2 + 3 + 4},
             {"1 - 2 + 3 - 4", 1 - 2 + 3 - 4},
             {"1 - 2 - 3 + 4", 1 - 2 - 3 + 4},
             {"1 - 2 - 3 - 4", 1 - 2 - 3 - 4}
           ] == Calculator.add_subtract([1, 2, 3, 4])
  end

  test "not enough elements" do
    assert [] == Calculator.add_subtract(["1"])
    assert [] == Calculator.add_subtract([])
  end
end
