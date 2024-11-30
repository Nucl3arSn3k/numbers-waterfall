import gleam/bit_array
import gleam/int
import gleam/io
import gleam/string

pub fn main() {
  //io.debug(<<6147:size(16)>>)

  let num = 6147
  let bits = <<num:size(16)>>
  let b_string = int.to_string(num)
  //Convert to binary manually
  let padded_bin = string.pad_left(b_string, 16, "0")
  io.println(padded_bin)
}

fn binary_conversion(a1: Int) {
  todo as "Just convert the int to base 2 manually"
}
