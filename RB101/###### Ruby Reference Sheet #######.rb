###### Ruby Reference Sheet #######

### Formating with a leading zero if only one decimal

format(%(#{degrees}#{DEGREE}%02d'%02d"), minutes, seconds)

puts "The result is #{format('%.3f', average)}"


### Deep cloning

array.map(&:clone)

## Summing with Inject
  x.inject do |total, n|
    total + n
  endc