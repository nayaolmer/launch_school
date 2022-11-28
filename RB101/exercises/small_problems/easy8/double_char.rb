def repeater(some_string)
  some_string.chars.map { |n| n * 2 }.join
end


puts repeater('Hello') == "HHeelllloo"
puts repeater("Good job!") == "GGoooodd  jjoobb!!"
puts repeater('') == ''