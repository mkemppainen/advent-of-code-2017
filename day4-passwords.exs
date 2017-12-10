defmodule Day4 do
  def solve do
    File.read!("day4-input.txt")
    |> String.trim
    |> count_valid
  end

  def count_valid(str) do
    str
    |> String.split("\n")
    |> Enum.map(&String.split/1)
    |> Enum.filter(fn(x) -> MapSet.size(MapSet.new(x)) == length(x) end)
    |> length
  end

  def solve2 do
    File.read!("day4-input.txt")
    |> String.trim
    |> count_valid2
  end
  
  def count_valid2(str) do
    str
    |> String.split("\n")
    |> Enum.map(&String.split/1)
    |> Enum.filter(fn(x) -> MapSet.size(MapSet.new(x)) == length(x) end)
    |> Enum.filter(&has_anagrams?/1)
    |> length
  end

  def has_anagrams?(list) do
    sorted =
      list
      |> Enum.map(&String.codepoints/1)
      |> Enum.map(&Enum.sort/1)
    
    MapSet.size(MapSet.new(sorted)) == length(sorted)
  end

end

Day4.solve2()
|> IO.inspect
