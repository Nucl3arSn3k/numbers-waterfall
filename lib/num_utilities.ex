defmodule NumUtilities do
  def binhelp(x) do
    list = []
    binarymanual(x,list)
  end


  @spec binarymanual(integer,list(integer)) :: list(integer)
  defp binarymanual(x,ints) do

    if x >= 2 do #was going to use match,but this is more legible
      c = div(x, 2)  #need to do this,not float division
      b = rem(x, 2)
      binarymanual(c,[b|ints])#prepend,will reverse list eventually. Doing this because append is expensive.
    else
      reverse = Enum.reverse(ints)
      x
    end
  end
end
