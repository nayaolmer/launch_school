

# def buy_fruit(grocery_list)
#   new_list = []
#   grocery_list.each do |sublist|
#     sublist[1].times { new_list << sublist[0]}
#   end
#   new_list
# end


def buy_fruit(grocery_list)
  grocery_list.map do |sublist|
    [sublist[0]] * sublist[1]
  end.flatten
end


puts buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]