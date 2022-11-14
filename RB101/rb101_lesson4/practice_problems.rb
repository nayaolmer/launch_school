
puts '---------------- Question 1 ----------------'

## Turn this array into a hash where the names are the keys 
## and the values are the positions in the array.

flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

new_hash = {}
flintstones.each_with_index do |n, index|
  new_hash[n] = index
end

puts new_hash.inspect


puts '---------------- Question 2 ----------------'
# Add up all of the ages from the Munster family hash:

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

puts ages.values.sum


puts '---------------- Question 3 ----------------'
# remove people with age 100 and greater.

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

# ages.select!{|_, v| v >= 100}
ages.keep_if{|_, v| v >= 100} 

puts ages.inspect

puts '---------------- Question 4 ----------------'
# Pick out the minimum age from our current Munster family hash:
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

puts ages.values.min

puts '---------------- Question 5 ----------------'
# Find the index of the first name that starts with "Be"

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

return_value = ''

flintstones.each_with_index do |n, index|
  return_value = index if n[0,2] == 'Be'
end

puts flintstones.index {|n| n[0,2] == 'Be'}

# return_value = return_value.to_i
puts "check  #{return_value}"


puts '---------------- Question 6 ----------------'
# Amend this array so that the names are all shortened to just the first three characters:

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones.map! { |n| n[0,3] }

puts flintstones


puts '---------------- Question 7 ----------------'
# Create a hash that expresses the frequency with which each letter occurs in this string:
statement = "The Flintstones Rock"

frequency_hash = {}

statement.chars.each do |n|
  frequency_hash[n] = statement.count(n)
end

puts frequency_hash.inspect


puts '---------------- Question 9 ----------------'
## Create a titlize method

def titlize(string_input)
  words = string_input.split(' ')
  words.map! {|n| n.capitalize}
  words.join(' ')
end

puts titlize("the flintstones rock")

puts '---------------- Question 10 ----------------'
=begin
Modify the hash such that each member of the Munster family has an additional 
"age_group" key that has one of three values describing the age group 
the family member is in (kid, adult, or senior). 
Your solution should produce the hash below
=end

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

## Criteria 
#### kid < 18
#### adult >= 18, < 65
#### senior >= 65

munsters.each do |k, v|
  munsters[k]['age_group'] = 'kid' if v['age'] < 18
  munsters[k]['age_group'] = 'adult' if v['age'] >= 18 && v['age'] < 65
  munsters[k]['age_group'] = 'senior' if v['age'] >= 18 && v['age'] >= 65
end

puts munsters.inspect