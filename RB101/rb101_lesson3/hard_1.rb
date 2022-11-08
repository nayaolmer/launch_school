#### Question 1
puts ('--------------------- Question 1 ---------------------')
if false
  greeting = "hello world"
end

p greeting

#### Question 2
puts ('--------------------- Question 2 ---------------------')

greetings = { a: 'hi' }
informal_greeting = greetings[:a]
informal_greeting << ' there'

puts informal_greeting  #  => "hi there"
puts greetings

#### Question 3
puts ('--------------------- Question 3 ---------------------')

# def mess_with_vars(one, two, three)
#   one = two
#   two = three
#   three = one
# end

# one = "one"
# two = "two"
# three = "three"

# mess_with_vars(one, two, three)

# puts "one is: #{one}"
# puts "two is: #{two}"
# puts "three is: #{three}"

# def mess_with_vars(one, two, three)
#   one = "two"
#   two = "three"
#   three = "one"
# end

# one = "one"
# two = "two"
# three = "three"

# mess_with_vars(one, two, three)

# puts "one is: #{one}"
# puts "two is: #{two}"
# puts "three is: #{three}"

# def mess_with_vars(one, two, three)
#   one.gsub!("one","two")
#   two.gsub!("two","three")
#   three.gsub!("three","one")
# end

# one = "one"
# two = "two"
# three = "three"

# mess_with_vars(one, two, three)

# puts "one is: #{one}"
# puts "two is: #{two}"
# puts "three is: #{three}"

#### Question 4
puts ('--------------------- Question 4 ---------------------')

def is_an_ip_number?(input_number)
  (0..255).include? input_number.to_i
end

# def dot_separated_ip_address?(input_string)
#   dot_separated_words = input_string.split(".")
#   while dot_separated_words.size > 0 do
#     word = dot_separated_words.pop
#     break unless is_an_ip_number?(word)
#   end
# end


def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  is_valid_ip = true 
  is_valid_ip = false if dot_separated_words.length != 4
  dot_separated_words.each do |n|
    is_valid_ip = false if is_an_ip_number?(n) == false 
    break if is_an_ip_number?(n) == false 
  end 
  return is_valid_ip
end


example_ip = "10.4.5.11"
false_example_ip = "10.4.5.300"

puts dot_separated_ip_address?(example_ip)
puts dot_separated_ip_address?(false_example_ip)
puts dot_separated_ip_address?("4.5.5")
puts dot_separated_ip_address?("1.2.3.4.5")
