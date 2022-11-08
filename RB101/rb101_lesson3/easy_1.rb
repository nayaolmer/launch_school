## Question 5:

# Programmatically determine if 42 lies between 10 and 100.

range_to_check = (10..100).to_a

range_to_check.each {|n| puts n if n == 42}

## Actual answer:

puts (10..100).cover? 42

## Question 6:

famous_words = "seven years ago..."

string_to_add = "Four score and "
# way 1:
famous_words.insert(0, string_to_add)
puts famous_words
#way 2:
famous_words = "seven years ago..."
famous_words.prepend(string_to_add)
puts famous_words

## Question 7

flintstones = ["Fred", "Wilma"]
flintstones << ["Barney", "Betty"]
flintstones << ["BamBam", "Pebbles"]

flintstones.flatten!

p flintstones

## Question 7

flintstones = { "Fred" => 0, 
                "Wilma" => 1, 
                "Barney" => 2, 
                "Betty" => 3,
                "BamBam" => 4, 
                "Pebbles" => 5 }


# flintstones = ["Barney", flintstones["Barney"]]

flintstones = flintstones.assoc("Barney")

p flintstones