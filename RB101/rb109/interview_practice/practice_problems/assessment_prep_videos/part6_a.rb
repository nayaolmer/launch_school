=begin
You are going to be given an array of integers. Your job is to take that array and find an index N where the sum of the integers to the left of N is equal to the sum of the integers to the right of N. If there is no index that would make this happen, return -1

p find_even_index([1, 2, 3, 4, 3, 2, 1]) == 3
p find_even_index([1, 100, 50, -51, 1, 1]) == 1
p find_even_index([1, 2, 3, 4, 5, 6]) == -1
p find_even_index([20, 10, 30, 10, 10, 15, 35]) == 3
p find_even_index([20, 10, -80, 10, 10, 15, 35]) == 0
p find_even_index([10, -80, 10, 10, 15, 35, 20]) == 6
p find_even_index([-1, -2, -3, -4, -3, -2, -1]) == 3


>>> Important to note: the index value is not included in the value of the sum

=end
=begin PEDAC
#### Understanding the problem
Our goal here is to find the index of an array of integers where the left side sum is equivalent to the right side sum. The sums do not include the index value

Input: an array of integers
Output: the index where the two sides' sum are equivalent

Requirements/edge cases/Assumptions
(1) do not include the index value in the sum
(2) If there is no index value where the two sides are equal, return -1
(3) Empty arrays sum to zero - for example, at index 0, the left side ([]) is an empty array, but we consider it to sum to zero
(4) we're only working with arrays of integers
(5) if there are two indexes that work, we only return the first one (smaller value)

#### Test cases
p find_even_index([1, 2, 3, 4, 3, 2, 1]) == 3
>>> left: [1, 2, 3], right: [3, 2, 1], index = 3
p find_even_index([1, 100, 50, -51, 1, 1]) == 1
>>> index = 1; left: [1], right = [50, -51, 1, 1]
p find_even_index([1, 2, 3, 4, 5, 6]) == -1
>>> no even index --- output -1
p find_even_index([20, 10, 30, 10, 10, 15, 35]) == 3
>>> index = 3; left = [20, 10, 30], right = [10, 15, 35]
p find_even_index([20, 10, -80, 10, 10, 15, 35]) == 0
>>> index = 0; left = [], right = [10, -80, 10, 10, 15, 35]
p find_even_index([10, -80, 10, 10, 15, 35, 20]) == 6
>>> index = 6; left = [10, -80, 10, 10, 15, 35], right = []
p find_even_index([-1, -2, -3, -4, -3, -2, -1]) == 3
>>> index = 3; left = [-1, -2, -3], right = [-3, -2, -1]

#### Algo
(1) define new method, `find_even_index`, which accepts one input parameter, an array of integers
(2) Iterate over each element in the array. If the sum of the left side == sum of the right, break the loop and return the index
>>> When left = [], set left.sum = 0; when right = [], set right.sum = 0;
(3) return the index if an index is returned, otherwise return -1

#### Code
=end

def find_even_index(some_arr)
  idx = 0
  even_index = -1
  while idx < some_arr.length
    left = some_arr[0...idx]
    right = some_arr[(idx+1)..-1]
    if left.sum == right.sum
      even_index = idx
      break
    else
      idx += 1
    end
  end
  even_index
end


p find_even_index([1, 2, 3, 4, 3, 2, 1]) == 3
p find_even_index([1, 100, 50, -51, 1, 1]) == 1
p find_even_index([1, 2, 3, 4, 5, 6]) == -1
p find_even_index([20, 10, 30, 10, 10, 15, 35]) == 3
p find_even_index([20, 10, -80, 10, 10, 15, 35]) == 0
p find_even_index([10, -80, 10, 10, 15, 35, 20]) == 6
p find_even_index([-1, -2, -3, -4, -3, -2, -1]) == 3



