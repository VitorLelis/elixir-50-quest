defmodule Questions do
  # 1
  @spec enum_from_to(integer(), integer()) :: list(integer())
  def enum_from_to(first, last) do
    cond do
      first > last ->
        [first | enum_from_to(first - 1, last)]

      first < last ->
        [first | enum_from_to(first + 1, last)]

      true ->
        [first]
    end
  end

  # 2
  @spec enum_from_then_to(integer(), integer(), integer()) :: list(integer())
  def enum_from_then_to(first, next, last) do
    if (first < next and first < last) or (first > next and first > last) do
      [first | enum_from_then_to(next, 2 * next - first, last)]
    else
      []
    end
  end

  # 3
  @spec concat(list(), list()) :: list()
  def concat([], list), do: list
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

  # 6
  @spec take(list(), integer()) :: list()
  def take([], _), do: []
  def take(_, 0), do: []
  def take([head | tail], n), do: [head | take(tail, n - 1)]

  # 7
  @spec drop(list(), integer()) :: list()
  def drop([], _), do: []
  def drop(list, 0), do: list
  def drop([_ | tail], n), do: drop(tail, n - 1)

  # 8
  @spec zip(list(), list()) :: list()
  def zip([], _), do: []
  def zip(_, []), do: []
  def zip([a | b], [c | d]), do: [{a, c} | zip(b, d)]

  # 9
  # Numbers between 7 and 14 not working
  @spec replicate(integer(), integer()) :: list(integer())
  def replicate(0, _), do: []
  def replicate(n, x), do: [x | replicate(n - 1, x)]

  # 10
  # Alias for list ?
  @spec intersperse(list(any()), any()) :: list(any())
  def intersperse([], _), do: []
  def intersperse([_] = singl,  _), do: singl
  def intersperse([head | tail], x), do: [head, x | intersperse(tail, x)]

  # 11
  @spec group(list()) :: list(list())
  def group([]), do: []

  def group([head | tail]) do
    [do_group([head | tail], head) | tail |> Enum.drop_while(& &1 == head) |> group()]
  end

  defp do_group([head | tail], x) when head == x, do: [head | do_group(tail, x)]
  defp do_group(_, _), do: []

  # 12
  @spec otherconcat(list(list())) :: list()
  def otherconcat([]), do: []
  def otherconcat([head | tail]), do: concat(head, otherconcat(tail))

  # 13
  @spec inits(list()) :: list(list())
  def inits(list), do: do_inits(list, [list])

  defp do_inits([], acc), do: acc

  defp do_inits(list, acc) do
    init = Enum.drop(list, -1)
    do_inits(init, [init | acc])
  end

  # 14
  @spec tails(list()) :: list(list())
  def tails([]), do: [[]]
  def tails([_ | tail] = list), do: [list | tails(tail)]

  # 15
  @spec heads(list(list())) :: list()
  def heads([]), do: []
  def heads([[head | _] | tail]), do: [head | heads(tail)]
  def heads([_ | tail]), do: heads(tail)

  # 16
  @spec total(list(list)) :: integer()
  def total([]), do: 0
  def total([head | tail]), do: length(head) + total(tail)

  # 17
  @spec fun(list(tuple())) :: list(tuple())
  def fun([]), do: []
  def fun([{x, _, y} | tail]), do: [{x, y} | fun(tail)]

  # 18
  @spec cola(list(tuple())) :: charlist()
  def cola([]), do: ""
  def cola([{str, _, _} | tail]), do: str <> cola(tail)

  # 19
  @spec idade(list(tuple), integer(), integer()) :: list(charlist())
  def idade([], _, _), do: []

  def idade([{name, year} | tail], current, age) do
    unless current - year < age do
      [name | idade(tail, current, age)]
    else
      idade(tail, current, age)
    end
  end

  # 20
  @spec power_enum_from(integer(), integer()) :: list(integer())
  def power_enum_from(_, 0), do: []

  def power_enum_from(base, exp) do
    base
    |> power_enum_from(exp - 1)
    |> List.insert_at(-1, Integer.pow(base, exp - 1))
  end

  # 21
  @spec prime?(integer()) :: boolean()
  def prime?(number), do: number >= 2 and do_prime?(number, 2)

  defp do_prime?(n, m) do
    cond do
      m * m > n -> true
      rem(n, m) == 0 -> false
      true -> do_prime?(n, m + 1)
    end
  end

  # 22
  @spec prefix_of?(list(), list()) :: boolean()
  def prefix_of?([], _), do: true
  def prefix_of?([x | xs], [y | ys]), do: x == y and prefix_of?(xs, ys)

  # 23
  @spec suffix_of?(list(), list()) :: boolean()
  def suffix_of?(a, b), do: prefix_of?(reverse(a), reverse(b))

  # 24
  @spec subsequence_of?(list(), list()) :: boolean()
  def subsequence_of?([], _), do: true

  def subsequence_of?(_, []), do: false

  def subsequence_of?([x | xs], [y | ys]) do
    if x == y do
      subsequence_of?(xs, ys)
    else
      subsequence_of?([x | xs], ys)
    end
  end

  # 25
  @spec elem_indices(list(any()), any()) :: list(integer())
  def elem_indices([], _), do: []
  def elem_indices(list, x), do: do_elem_indices(list, x, 0)

  defp do_elem_indices([], _, _), do: []

  defp do_elem_indices([head | tail], x, acc) do
    if head == x do
      [acc | do_elem_indices(tail, x, acc + 1)]
    else
      do_elem_indices(tail, x, acc + 1)
    end
  end
end
