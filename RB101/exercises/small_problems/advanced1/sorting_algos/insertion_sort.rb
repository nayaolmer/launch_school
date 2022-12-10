


# Iterate from arr[1] to arr[N] over the array.
# Compare the current element (key) to its predecessor.
# If the key element is smaller than its predecessor,
# compare it to the elements before.
# Move the greater elements one position up to make space for the swapped element.


[12, 11, 13, 5, 6]


def insertion_sort(arr)
  def compare_and_swap(arr, idx1, idx2)
    arr[idx1], arr[idx2] = arr[idx2], arr[idx1]
  end
  elem_loop = 1
  while elem_loop < arr.length
    i = elem_loop
    until arr[i] > arr[i - 1] || i == 0
      compare_and_swap(arr, i, i - 1)
      i += -1
    end
    elem_loop += 1
  end
end





