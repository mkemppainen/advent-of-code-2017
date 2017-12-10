# 100 99  98  97  96  95  94  93  92  91
# 65  64  63  62  61  60  59  58  57  90
# 66  37  36  35  34  33  32  31  56  89
# 67  38  17  16  15  14  13  30  55  88
# 68  39  18   5   4   3  12  29  54  87
# 69  40  19   6   1   2  11  28  53  86
# 70  41  20   7   8   9  10  27  52  85
# 71  42  21  22  23  24  25  26  51  84
# 72  43  44  45  46  47  48  49  50  83
# 73  74  75  76  77  78  79  80  81  82    

# ring0: 1      1  
# ring1: 2-9    8 =4*(2*1)
# ring2: 10-25  16=4*(2*2)
# ring3: 26-49  24=4*(2*3)
# ring4: 50-81  32=4*(2*4)
# ring5: 82-121 40=4*(2*5)

# ring_n-1: a-b         c =4*(2*(n-1))
# ring_n:   (b+1)-(b+f) f =4*(2*n)

defmodule Day3 do
  @input 277678
  # @input 1024
  
  def solve do
    ring = ring_no(@input)
    difference = last_ring_number(ring) - @input
    rem = rem(difference,ring*2)
    rem - ring
    |> abs
    |> (&(&1 + ring)).()
  end

  def last_ring_number(n), do: :math.pow(2*n + 1,2) |> round

  def ring_no(n), do: ring_no(n, 0)
  def ring_no(number, ring) do
    if last_ring_number(ring) >= number do
      ring
    else
      ring_no(number, ring + 1)
    end
  end
end

Day3.solve
|> IO.puts


kahdenlaisia numeroita
sisemman kehan numerot
ja edelliset numerot
sisempia 1-3
ulompia  1-2

ring_no * 2 askelta reunan pituus
reuna * jjjj


def this(i,a,b) do
  a = this(j,k,l) = [hd|tl]
  
end
