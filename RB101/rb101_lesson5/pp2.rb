puts '-------------------- Question 1 --------------------'
arr = ['10', '11', '9', '7', '8']

arr.sort! do |a, b|
  a.to_i <=> b.to_i
end

p arr

puts '-------------------- Question 2 --------------------'

books = [
  {title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez', published: '1967'},
  {title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published: '1925'},
  {title: 'War and Peace', author: 'Leo Tolstoy', published: '1869'},
  {title: 'Ulysses', author: 'James Joyce', published: '1922'}
]

books.sort_by! { |n| n[:published].to_i}

p books

puts '-------------------- Question 9 --------------------'

arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]

x = arr.map { |subarr| subarr.sort {|a, b| b <=> a}}

p arr
p x

puts '-------------------- Question 9 --------------------'

a1 = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]

a1.map do |element|
  new_hash = Hash.new
  element.map do |k, v|
    new_hash[k] = v + 1
  end
  new_hash
end

a2 = {a:1, b:2, c:3, d:4}

a2.each do |k, v|
  a2[k] = v + 1
end

p a2
# p x


puts '-------------------- Practice Hash --------------------'

arr = [
      { id: 1, name: 'Math', completed: false },
      { id: 2, name: 'English', completed: false }
    ]

arr.each do |element|
  element[:completed] = true
end

arr = [[1], [2], [3]]

arr.each do |element|
  element[0] += 1
end
