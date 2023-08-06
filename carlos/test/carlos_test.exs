defmodule CarlosTest do
  use ExUnit.Case
  doctest Carlos

  test "greets the world" do
    assert Carlos.hello() == :world
  end
end
