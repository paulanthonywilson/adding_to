defmodule AddingToTest do
  use ExUnit.Case
  doctest AddingTo

  test "greets the world" do
    assert AddingTo.hello() == :world
  end
end
