puts '-------------------- Question 1 --------------------'
# How would you order this array of number strings by descending numeric value?

arr = ['10', '11', '9', '7', '8']

arr = arr.map {|n| n.to_i}.sort.reverse.map{|n| n.to_s}

# better
arr = ['10', '11', '9', '7', '8']
arr.sort do |a, b|
  b.to_i <=> a.to_i
end


puts '-------------------- Question 2 --------------------'
## How would you order this array of hashes based on the year of publication of each book, from the earliest to the latest?

books = [
  {title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez', published: '1967'},
  {title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published: '1925'},
  {title: 'War and Peace', author: 'Leo Tolstoy', published: '1869'},
  {title: 'Ulysses', author: 'James Joyce', published: '1922'}
]

books.sort do |a, b|
  a[:published].to_i <=> b[:published].to_i
end

puts '-------------------- Question 3 --------------------'
## For each of these collection objects demonstrate how you would reference the letter 'g'.

arr1 = ['a', 'b', ['c', ['d', 'e', 'f', 'g']]]
puts arr1[2][1][3]

arr2 = [{first: ['a', 'b', 'c'], second: ['d', 'e', 'f']}, {third: ['g', 'h', 'i']}]
puts arr2[1][:third][0]

arr3 = [['abc'], ['def'], {third: ['ghi']}]
puts arr3[2][:third][0][0]

hsh1 = {'a' => ['d', 'e'], 'b' => ['f', 'g'], 'c' => ['h', 'i']}
puts hsh1['b'][1]

hsh2 = {first: {'d' => 3}, second: {'e' => 2, 'f' => 1}, third: {'g' => 0}}
puts hsh2[:third].keys[0]


puts '-------------------- Question 4 --------------------'
## For each of these collection objects where the value 3 occurs, demonstrate how you would change this to 4.

arr1 = [1, [2, 3], 4]
arr1[1][1] = 4
p arr1

arr2 = [{a: 1}, {b: 2, c: [7, 6, 5], d: 4}, 3]
arr2[2]= 4
p arr2

hsh1 = {first: [1, 2, [3]]}
hsh1[:first][2][0] = 4
p hsh1

hsh2 = {['a'] => {a: ['1', :two, 3], b: 4}, 'b' => 5}
hsh2[['a']][:a][2] = 4
p hsh2


puts '-------------------- Question 5 --------------------'

# figure out the total age of just the male members of the family.

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

male_ages = munsters.map do |k1, v1|
            if v1["gender"] == "male"
              v1["age"]
            else 
              0
            end
          end

p male_ages.sum

## Better way:
munsters.select{|k1, v1| v1["gender"] == 'male'}.map{|k1, v1| v1["age"]}.sum



puts '-------------------- Question 6 --------------------'
# Given this previously seen family hash, print out the name, age and gender of each family member:
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each do |name, sub_hash|
  puts "#{name} is a #{sub_hash["age"]}-year-old #{sub_hash["gender"]}"
end 


# (Name) is a (age)-year-old (male or female).


puts '-------------------- Question 8 --------------------'
#Using the each method, write some code to output all of the vowels from the strings.

hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

## so now that we have the method to oupt all vowels, get a method to iterate over each string

x = hsh.map do |key, value|
  value.map do |n|
    n.split('').partition {|n| %w(a e i o u).include?(n)}[0].join('')
  end
end

p x

puts '-------------------- Question 9 --------------------'
## Given this data structure, return a new array of the same structure 
## but with the sub arrays being ordered (alphabetically or numerically 
## as appropriate) in descending order.

arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]


x = arr.map do |sub_array_1|
  sub_array_1.sort.reverse
end


# OR 

y = arr.map do |subarray_1|
  subarray_1.sort do |a, b|
    b <=> a
  end
end

p y

puts '-------------------- Question 10 --------------------'
array = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]

array.map { |ii| ii.map { |k, v| {k => v +1} } }.flatten


## another way: 

array.map do |ii|
  hash_incremented = {}
  ii.each do |k, v|
    hash_incremented[k] = v + 1
  end
  hash_incremented
end

puts '-------------------- Question 11 --------------------'
# return a new array identical in structure to the original but 
# containing only the integers that are multiples of 3

arr = [[2], [3, 5, 7, 12], [9], [11, 13, 15]]

arr.map do |subarray|
  subarray.reject do |n|
    n % 3 != 0
  end
end

## OR, using select

arr.map do |subarray|
  subarray.select do |n|
    n % 3 == 0
  end
end

puts '-------------------- Question 12 --------------------'
arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]

# expected return value: {:a=>1, "b"=>"two", "sea"=>{:c=>3}, {:a=>1, :b=>2, :c=>3, :d=>4}=>"D"}

arr.map do |subarray|
  new_hash = Hash.new
  new_hash[subarray[0]] = subarray[1]
  new_hash
end

puts '-------------------- Question 13 --------------------'
arr = [[1, 6, 9], [6, 1, 7], [1, 8, 3], [1, 5, 9]]

arr.sort do |a, b|
  a.reject {|n| n.even?} <=> b.reject {|n| n.even?}
end

## Their solution 
arr.sort_by do |subarray|
  subarray.select do |n|
    n.odd?
  end
end

puts '-------------------- Question 14 --------------------'

# return an array containing the colors of the fruits, 
# and the sizes of the vegetables. 
# The sizes should be uppercase and the colors should be capitalized.

hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}

## [["Red", "Green"], "MEDIUM", ["Red", "Green"], ["Orange"], "LARGE"]

hsh.map do |k1, v1|
  if v1[:type] == 'fruit'
    v1[:colors].map {|color| color.capitalize}
  elsif v1[:type] == 'vegetable'
    v1[:size].upcase
  end
end


puts '-------------------- Question 15 --------------------'
# return an array which contains only the hashes where all the integers are even.

arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]

arr.map { |n| n.select { |k, v| v.all? { |ii| ii.even? } } }.select {|n2| !n2.empty?}

## Correct solution:

arr.select do |hsh|
  hsh.all? do |k, v|
    v.all? do |ii|
      ii.even?
    end
  end
end

puts '-------------------- Question 16 --------------------'
## Create a UUID 
#### P - understand the problem.

## Input: none
## Output: a UUID

## Explicit requirements:
## > 8-4-4-4-12 is the sequence of characters
## > characters must be hexidecimal characters ( a b c d e f 0 1 2 3 4 5 6 7 8 9 )
## > characters must be randomly chosen

## Implicit requirements
## > output is a string

valid_chars = %w(a b c d e f 0 1 2 3 4 5 6 7 8 9)
section1 = valid_chars.sample(8).join
section2 = valid_chars.sample(4).join
section3 = valid_chars.sample(4).join
section4 = valid_chars.sample(4).join
section5 = valid_chars.sample(12).join

uuid = "#{section1}-#{section2}-#{section3}-#{section4}-#{section5}"

puts uuid

def generate_uuid
  valid_chars = %w(a b c d e f 0 1 2 3 4 5 6 7 8 9)
  section1 = valid_chars.sample(8).join
  section2 = valid_chars.sample(4).join
  section3 = valid_chars.sample(4).join
  section4 = valid_chars.sample(4).join
  section5 = valid_chars.sample(12).join
  uuid = "#{section1}-#{section2}-#{section3}-#{section4}-#{section5}"

end













