
defmodule NumWaterfall do

  def main do
    random_number = :rand.uniform(5000)
    NumUtilities.binhelp(random_number)
  end
end
