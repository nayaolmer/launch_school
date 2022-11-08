## Question 1

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

puts ages.include? "Spot"

puts !!ages["Spot"]

puts ages.has_key?("Spot")


## Question 2

munsters_description = "The Munsters are creepy in a good way."

# "tHE mUNSTERS ARE CREEPY IN A GOOD WAY."
puts munsters_description.swapcase

# "The munsters are creepy in a good way."
puts munsters_description.capitalize

# "the munsters are creepy in a good way."
puts munsters_description.downcase

# "THE MUNSTERS ARE CREEPY IN A GOOD WAY."
puts munsters_description.upcase

## Question 3
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10 }
additional_ages = { "Marilyn" => 22, "Spot" => 237 }

# ages["Marilyn"] = 22
# ages["Spot"] = 237

ages.merge!(additional_ages)

puts ages.inspect

## Question 4

advice = "Few things in life are as important as house training your pet dinosaur."

string_to_check = "Dino"

puts advice.include? string_to_check
puts advice.match? string_to_check

## Question 5
# flintstones = ["Fred", "Barney", "Wilma", "Betty", "BamBam", "Pebbles"]
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

p flintstones

## Question 6 
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones << "Dino"

p flintstones

## Question 7
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

#### add dino and hoppy

# flintstones.push('Dino','Hoppy')
flintstones.concat(['Dino','Hoppy'])

p flintstones

## Question 8
advice = "Few things in life are as important as house training your pet dinosaur."

puts advice.slice!("Few things in life are as important as ")
puts advice

## Question 9
statement = "The Flintstones Rock!"

# puts statement.chars.count('t')
#### Better:
statement.count('t')

## Question 10
title = "Flintstone Family Members"

# spaces_to_add = (40 - title.length)/2

# spaces_to_add.times { title = ' ' + title + ' ' }

#### Better:
title = title.center(40)

puts title