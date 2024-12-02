
defmodule NumWaterfall do

  def main do
    #random_number = :rand.uniform(5000)
    val = NumUtilities.binhelp(6)
    IO.inspect(val, label: "val")
    IO.puts("num is #{inspect(val)}")
  end
end
