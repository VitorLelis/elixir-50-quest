defmodule Questions do
  # 1
  @spec enumFromTo(integer(), integer()) :: list(integer())
  def enumFromTo(first, last) do
    cond do
      first > last ->
        [first | enumFromTo(first - 1, last)]

      first < last ->
        [first | enumFromTo(first + 1, last)]

      true ->
        [first]
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

  def intersperse([head | tail], x) do
    l = length([head | tail])

    cond do
      l > 2 ->
        [head | [x | intersperse(tail, x)]]

      l == 2 ->
        [head | [x | tail]]

      true ->
        [head | tail]
    end
  end

  # 11
  @spec group(list()) :: list(list())
  def group([]), do: []

  def group([head | tail]) do
    [auxgroup([head | tail], head) | Enum.drop_while(tail, fn t -> t == head end) |> group()]
  end

  defp auxgroup([], _), do: []

  defp auxgroup([head | tail], x) do
    if head == x do
      [head | auxgroup(tail, x)]
    else
      []
    end
  end

  # 12
  @spec otherconcat(list(list())) :: list()
  # def otherconcat(list), do: List.flatten(list)
  def otherconcat([]), do: []
  def otherconcat([head | tail]), do: concat(head, otherconcat(tail))

  # 13
  @spec inits(list()) :: list(list())
  def inits([]), do: [[]]

  def inits(list) do
    list
    |> List.pop_at(-1)
    |> elem(1)
    |> inits()
    |> List.insert_at(-1, list)
  end

  # 14
  @spec tails(list()) :: list(list())
  def tails([]), do: [[]]
  def tails([head | tail]), do: [[head | tail] | tails(tail)]

  # 15
  @spec heads(list(list)) :: list()
  def heads([]), do: []

  def heads([head | tail]) do
    unless List.first(head) == nil do
      [List.first(head) | heads(tail)]
    else
      heads(tail)
    end
  end

  # 16
  @spec total(list(list)) :: integer()
  def total([]), do: 0
  # def total(list), do: List.flatten(list) |> length()
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
  @spec powerEnumFrom(integer(), integer()) :: list(integer())
  def powerEnumFrom(_, 0), do: []

  def powerEnumFrom(base, exp) do
    base
    |> powerEnumFrom(exp - 1)
    |> List.insert_at(-1, Integer.pow(base, exp - 1))
  end

  # 21
  @spec isPrime(integer()) :: boolean()
  def isPrime(2), do: true

  def isPrime(number) do
    number
    |> :math.sqrt()
    |> round()
    |> enumFromTo(2)
    |> Enum.filter(fn x -> Integer.mod(number, x) == 0 end)
    |> Enum.empty?()
  end

  # 22
  @spec isPrefixOf(list(), list()) :: boolean()
  def isPrefixOf([], _), do: true

  def isPrefixOf([x | y], [z | w]) do
    unless x != z do
      isPrefixOf(y, w)
    else
      false
    end
  end

  # 23
  @spec isSuffixOf(list(), list()) :: boolean()
  def isSuffixOf(a, b), do: isPrefixOf(reverse(a), reverse(b))

  # 24
  @spec isSubsequenceOf(list(), list()) :: boolean()
  def isSubsequenceOf([], _), do: true
  def isSubsequenceOf(_, []), do: false

  def isSubsequenceOf([x | y], [z | w]) do
    unless x != z do
      isSubsequenceOf(y, w)
    else
      isSubsequenceOf([x | y], w)
    end
  end

  # 25
  @spec elemIndices(list(any()), any()) :: list(integer())
  def elemIndices([], _), do: []
  def elemIndices(lst, x), do: auxelem(lst, x, 0)

  defp auxelem([], _, _), do: []

  defp auxelem([head | tail], x, acc) do
    if head == x do
      [acc | auxelem(tail, x, acc + 1)]
    else
      auxelem(tail, x, acc + 1)
    end
  end
end
