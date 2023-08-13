defmodule Questions do
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

  # 6
  @spec take(list(), integer()) :: list()
  def take([],_), do: []
  def take(_, 0), do: []
  def take([head | tail], n), do: [head | take(tail, n-1)]

  # 7
  @spec drop(list(),integer()) :: list()
  def drop([],_), do: []
  def drop(list,0), do: list
  def drop([_|tail], n), do: drop(tail,n-1)

  # 8
  @spec zip(list(), list()) :: list()
  def zip([],_), do: []
  def zip(_,[]), do: []
  def zip([a | b], [c | d]), do: [{a,c} | zip(b,d)]

  # 9
  # Numbers between 7 and 14 not working
  @spec replicate(integer(),integer()) :: list(integer())
  def replicate(0,_), do: []
  def replicate(n,x), do: [x | replicate(n-1,x)]

  # 10
  # Define Generic types ?
  # Alias for list ?
  @spec intersperse(list(integer()),integer()) :: list(integer())
  def intersperse([], _), do: []
  def intersperse([head | tail],x) do
    l = length([head | tail])
    cond do
      l > 2 ->
        [head | [x | intersperse(tail,x)]]
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
     [auxgroup([head | tail], head) | Enum.drop_while(tail, fn(t) -> t == head end) |> group()]
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
  def otherconcat([head | tail]), do: head ++ otherconcat(tail) # Is there any faster way?
end
