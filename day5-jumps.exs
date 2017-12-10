defmodule Day5 do
  def solve do
    File.read!("day5-input.txt")
    |> String.trim
    |> String.split("\n")
    |> IO.inspect
    # |> count_jumps
  end

  def count_jumps(list), do: count_jumps(list, 0, 0)
  def count_jumps(list = [hd|tl], current, count), when current == count do
    
    Enum.update_at
    count_jumps
  end

  def (list = [hd|tl], current, count), when current == count do
    
  end
end

Day5.solve


olaan alussa
