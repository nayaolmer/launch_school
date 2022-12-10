def transpose(matrix)
  matrix_columns = matrix[0].length - 1
  matrix_rows = matrix.size - 1


  matrix_t = []
  (0..matrix_columns).to_a.each do |n|
    new_array = []
    (0..matrix_rows).to_a.each do |m|
      new_array << matrix[m][n]
    end
    matrix_t << new_array
  end
  matrix_t
end


puts transpose([[1, 2, 3, 4]]) == [[1], [2], [3], [4]]
puts transpose([[1], [2], [3], [4]]) == [[1, 2, 3, 4]]
puts transpose([[1, 2, 3, 4, 5], [4, 3, 2, 1, 0], [3, 7, 8, 6, 2]]) ==
  [[1, 4, 3], [2, 3, 7], [3, 2, 8], [4, 1, 6], [5, 0, 2]]
puts transpose([[1]]) == [[1]]