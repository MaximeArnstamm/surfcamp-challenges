def roman_to_integer(roman_string)
  #TODO: translate roman string to integer
  roman_numbers = {
    "I" => 1,
    "V" => 5,
    "X" => 10,
    "L" => 50,
    "C" => 100,
    "D" => 500,
    "M" => 1000,
    "IV" => 4,
    "IX" => 9,
    "XC" => 90,
    "CM" => 900
  }

  roman_numbers_order = ["CM", "M", "D", "XC", "C", "L", "IX", "X", "IV", "V", "I"]

  roman_numbers_order.reduce(0) do |sum, r|
      nb = roman_string.scan(r).size
      roman_string.slice!(r)
      sum + nb * roman_numbers[r]
  end
end

# testing your program
puts roman_to_integer("II")
puts roman_to_integer("IV")
puts roman_to_integer("IV") == 4 # => true
puts roman_to_integer("XII") == 12 # => true
puts roman_to_integer("XIX") == 19 # => true
puts roman_to_integer("XVIII")
