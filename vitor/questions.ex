defmodule Question do
  # 1
  @spec enumFromTo(integer(), integer()) :: list(integer())
  def enumFromTo(first, last) do
    unless first > last do
      [first | enumFromTo(first + 1, last)]
    else
      []
    end
  end

  # 2
  @spec enumFromThenTo(integer(), integer(), integer()) :: list(integer())
  def enumFromThenTo(first, next, last) do
    if (first < next and first < last) or (first > next and first > last) do
      [first | enumFromThenTo(next, 2 * next - first, last)]
    else
      []
    end
  end

  # 3
  @spec concat(list(), list()) :: list()
  def concat([], list), do: list
  # def concat(a, b), do: [a|b] -> Needs to be recursive
  def concat([head | tail], list), do: [head | concat(tail, list)]

  # 4
  @spec index(list(integer()), integer()) :: integer()
  def index([head | _], 0), do: head
  def index([_ | tail], n), do: index(tail, n - 1)
  def index(_, _), do: nil

  # 5
  @spec reverse(list()) :: list()
  def reverse(list), do: do_reverse(list, [])

  defp do_reverse([], acc), do: acc
  defp do_reverse([head | tail], acc), do: do_reverse(tail, [head | acc])
end
