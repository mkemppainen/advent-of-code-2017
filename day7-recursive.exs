defmodule Day7 do
  @input """
  pbga (66)
  xhth (57)
  ebii (61)
  havc (66)
  ktlj (57)
  fwft (72) -> ktlj, cntj, xhth
  qoyq (66)
  padx (45) -> pbga, havc, qoyq
  tknk (41) -> ugml, padx, fwft
  jptl (61)
  ugml (68) -> gyxo, ebii, jptl
  gyxo (61)
  cntj (57)
  """
  
  def solve do
    File.read!("day7-input.txt")
    |> String.trim
    |> String.replace(",", "")
    |> String.split("\n")
    |> Enum.map(&String.split/1)
    |> Enum.map(&parse/1)
    |> find_roots
    |> hd
    |> IO.inspect(limit: 20)
  end
  
  def solve2 do
    # File.read!("day7-input.txt")
    @input
    |> String.trim
    |> String.replace(",", "")
    |> String.split("\n")
    |> Enum.map(&String.split/1)
    |> Enum.map(&parse/1)
    |> make_tree
    |> find_unbalanced
    |> IO.inspect(limit: 20)
  end

  def make_tree(list) do
    [root | _rest] = find_roots(list)
    # children = tl(Enum.find(list, fn(x) -> hd(x) == root end))
    # rest = Enum.filter(list, fn(x) -> hd(x) != root end)
    make_tree(list, root)
  end

  # def make_tree
  def make_tree(list, root) do
    [_root, value | children] =
      list
      |> Enum.find(list, fn(x) -> hd(x) == root end)
    {root, value, (for x <- children, do: make_tree(list, x))}
  end

  def find_unbalanced(tree = {_name, _weight, children}) do
    case Enum.find(children, &is_unbalanced/1) do
      nil -> tree
      tree -> find_unbalanced(tree)
    end
  end

  def is_unbalanced({_name, _weight, []}), do: false
  def is_unbalanced({_name, _weight, children}) do
    children
    |> Enum.map(&tree_weight/1)
    |> all_same?
  end

  def all_same?([]), do: true
  def all_same?([_]), do: true
  def all_same?([hd, hd | tl]), do: all_same?([hd | tl])
  def all_same?(_), do: false

  # def tree_weight([]), do: 0
  def tree_weight({_name, weight, children}) do
    children_weight =
      children
      |> Enum.map(&tree_weight/1)
      |> Enum.sum

    weight + children_weight
  end

  def parse([]), do: []
  def parse([parent]), do: [parent]
  def parse(["->" | children]), do: children
  def parse([parent, weight | rest]) do
    weight_value =
      weight
      |> String.slice(1..-2)
      |> String.to_integer
    
    [parent, weight_value | parse(rest)]
  end

  def find_roots(list), do: find_roots(list, MapSet.new, MapSet.new)
  def find_roots([], root_candidates, not_roots) do
    MapSet.difference(root_candidates, not_roots)
    |> MapSet.to_list
  end
  def find_roots([[parent | children] | rest], root_candidates, not_roots) do
    root_candidates = MapSet.put(root_candidates, parent)
    not_roots = for x <- children, into: not_roots, do: x
    find_roots(rest, root_candidates, not_roots)
  end
end

Day7.solve2
