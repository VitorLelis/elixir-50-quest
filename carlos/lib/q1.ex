defmodule Q1 do
  @moduledoc """
  Provide a definition of the recursive function (predefined) enumFromTo :: Int -> Int -> [Int] which builds the list of integers between two limits.
  For example, enumFromTo 1 5 matches the list [1,2,3,4,5]
  """

  @doc """
  Returns a list of integers between two limits.

  Implemented using [cond](https://hexdocs.pm/elixir/main/case-cond-and-if.html#cond).

  ## Parameters

    - from: Starting integer.
    - to: Final integer.

  ## Examples

      iex> Q1.enumFromTo(1, 3)
      [1, 2, 3]

      iex> Q1.enumFromTo(1, 1)
      [1]

      iex> Q1.enumFromTo(1, 0)
      []

  """
  @spec enumFromTo(integer(), integer()) :: list(integer())
  def enumFromTo(from, to) do
    cond do
      from <= to -> [from | enumFromTo(from + 1, to)]
      true -> []
    end
  end

  @doc """
  Implemented using [guards](https://hexdocs.pm/elixir/main/patterns-and-guards.html#guards).
  """
  @spec enumFromTo1(integer(), integer()) :: list(integer())
  def enumFromTo1(from, to) when from <= to do
    [from | enumFromTo(from + 1, to)]
  end

  def enumFromTo1(_from, _to), do: []

  @doc """
  Implemented using [if](https://hexdocs.pm/elixir/main/case-cond-and-if.html#if-unless).
  """
  @spec enumFromTo2(integer(), integer()) :: list(integer())
  def enumFromTo2(from, to) do
    if from <= to do
      [from | enumFromTo(from + 1, to)]
    else
      []
    end
  end

  @doc """
  Implemented using [unless](https://hexdocs.pm/elixir/main/case-cond-and-if.html#if-unless).
  """
  @spec enumFromTo3(integer(), integer()) :: list(integer())
  def enumFromTo3(from, to) do
    unless from > to do
      [from | enumFromTo(from + 1, to)]
    else
      []
    end
  end

  @doc """
  Implemented using [..](https://hexdocs.pm/elixir/Kernel.html#../2) and the [Range](https://hexdocs.pm/elixir/Range.html) module.
  """
  @spec enumFromTo4(integer(), integer()) :: list(integer())
  def enumFromTo4(from, to) do
    Range.to_list(from..to)
  end
end
