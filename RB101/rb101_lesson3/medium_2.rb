#### Question 3

puts ('--------------------- Question 3 ---------------------')

def tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param << "rutabaga"
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"

#### Question 5

puts ('--------------------- Question 5 ---------------------')

def tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param += ["rutabaga"]

  return a_string_param, an_array_param
end

my_string = "pumpkins"
my_array = ["pumpkins"]
my_string, my_array = tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"

#### Question 6

puts ('--------------------- Question 6 ---------------------')

def color_valid(color)
  if color == "blue" || color == "green"
    true
  else
    false
  end
end

puts color_valid("blue")
puts color_valid("grey") 

def color_valid_2(color)
  color == "blue" or color == "green"
end

puts color_valid_2("blue")
puts color_valid_2("grey") 

