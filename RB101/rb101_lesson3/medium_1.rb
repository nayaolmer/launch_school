#### Question 1

# string_to_repeat = "The Flintstones Rock!"

# 10.times { puts string_to_repeat.prepend(" ")}


#### Question 2
puts "---------------- Question 2 ----------------"

# puts "the value of 40 + 2 is " + (40 + 2) ## Error

puts "the value of 40 + 2 is " + (40 + 2).to_s

puts "the value of 40 + 2 is #{40 + 2}"


#### Question 3
puts "---------------- Question 3 ----------------"
def factors(number)
  divisor = number
  factors = []
  begin
    factors << number / divisor if number % divisor == 0
    divisor -= 1
  end until divisor == 0
  factors
end


def factors(number)
  if number <=0
    return "#{number} is an invalid entry, please enter a number > 0"
  else
    numbers_to_check = (2..number).to_a 
    divisors = []
    numbers_to_check.each do |n| 
      divisors << n if number % n == 0
    end
    return divisors
  end
end

p factors(10)
p factors(0)
p factors(-1)

#### Question 4
puts "---------------- Question 4 ----------------"
def rolling_buffer1(buffer, max_buffer_size, new_element)
  p buffer
  buffer << new_element
  p buffer
  buffer.shift if buffer.size > max_buffer_size
  p buffer
  buffer
end

def rolling_buffer2(input_array, max_buffer_size, new_element)
  p input_array
  buffer = input_array + [new_element]
  p buffer
  buffer.shift if buffer.size > max_buffer_size
  p buffer
  buffer
end

test_buffer = [1, 2, 3, 4, 5]

p rolling_buffer1(test_buffer, 5, 10)
puts ('------------')

test_buffer = [1, 2, 3, 4, 5]

p rolling_buffer2(test_buffer, 5, 10)

#### Question 7
puts "---------------- Question 7 ----------------"

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

def mess_with_demographics(demo_hash)
  demo_hash.values.each do |family_member|
    family_member["age"] += 42
    family_member["gender"] = "other"
  end
end

mess_with_demographics(munsters)

p munsters

#### Question 8
puts "---------------- Question 8 ----------------"

def rps(fist1, fist2)
  if fist1 == "rock"
    (fist2 == "paper") ? "paper" : "rock"
  elsif fist1 == "paper"
    (fist2 == "scissors") ? "scissors" : "paper"
  else
    (fist2 == "rock") ? "rock" : "scissors"
  end
end

puts rps(rps(rps("rock", "paper"), rps("rock", "scissors")), "rock")


#### Question 9
puts "---------------- Question 9 ----------------"

def foo(param = "no")
  "yes"
end

def bar(param = "no")
  param == "no" ? "yes" : "no"
end

puts bar(foo)




