defmodule Q2 do
  @moduledoc """
  Provide a definition of the recursive function (predefined) enumFromThenTo :: Int -> Int -> Int -> [Int] which builds the list of integers between two limits, spaced by a constant value.
  For example, enumFromThenTo 1 3 10 matches the list [1,3,5,7,9].
  """

  @doc """
  Returns a list of integers between two limits, spaced by a constant value.

  Implemented using [guards](https://hexdocs.pm/elixir/main/patterns-and-guards.html#guards).

  ## Parameters

    - from: Starting integer.
    - then: Next integer.
    - to: Final integer.

  ## Examples

      iex> Q2.enumFromThenTo(1, 3, 10)
      [1, 3, 5, 7, 9]

      iex> Q2.enumFromThenTo(10, 7, 1)
      [10, 7, 4, 1]

  """
  @spec enumFromThenTo(integer(), integer(), integer()) :: list(integer())
  def enumFromThenTo(from, then, to)
      when (from <= to and then >= from) or (from >= to and then <= from) do
    [from | enumFromThenTo(then, 2 * then - from, to)]
  end

  def enumFromThenTo(_from, _then, _to), do: []

  @doc """
  Implemented using [guards](https://hexdocs.pm/elixir/main/patterns-and-guards.html#guards).
  """
  @spec enumFromThenTo1(integer(), integer(), integer()) :: list(integer())
  def enumFromThenTo1(from, then, to)
      when (from > to and then >= from) or (from < to and then <= from),
      do: []

  def enumFromThenTo1(from, then, to) do
    [from | enumFromThenTo(then, 2 * then - from, to)]
  end

  @doc """
  Implemented using [if](https://hexdocs.pm/elixir/main/case-cond-and-if.html#if-unless).
  """
  @spec enumFromThenTo2(integer(), integer(), integer()) :: list(integer())
  def enumFromThenTo2(from, then, to) do
    if (from <= to and then >= from) or (from >= to and then <= from) do
      [from | enumFromThenTo(then, 2 * then - from, to)]
    else
      []
    end
  end

  @doc """
  Implemented using [unless](https://hexdocs.pm/elixir/main/case-cond-and-if.html#if-unless).
  """
  @spec enumFromThenTo3(integer(), integer(), integer()) :: list(integer())
  def enumFromThenTo3(from, then, to) do
    unless (from > to and then >= from) or (from < to and then <= from) do
      [from | enumFromThenTo(then, 2 * then - from, to)]
    else
      []
    end
  end

  @doc """
  Implemented using [cond](https://hexdocs.pm/elixir/main/case-cond-and-if.html#cond).
  """
  @spec enumFromThenTo4(integer(), integer(), integer()) :: list(integer())
  def enumFromThenTo4(from, then, to) do
    cond do
      (from > to and then >= from) or (from < to and then <= from) -> []
      true -> [from | enumFromThenTo(then, 2 * then - from, to)]
    end
  end

  @doc """
  Implemented using [..//](https://hexdocs.pm/elixir/Kernel.html#..///3) and the [Range](https://hexdocs.pm/elixir/Range.html) module.
  """
  @spec enumFromThenTo5(integer(), integer(), integer()) :: list(integer())
  def enumFromThenTo5(from, then, to) do
    Range.to_list(from..to//then - from)
  end
end
