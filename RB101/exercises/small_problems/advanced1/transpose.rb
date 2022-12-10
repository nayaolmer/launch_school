




matrix = [[1, 2, 3],
          [4, 5, 6],
          [7, 8, 9]]

# matrix_t_ans = [[1, 4, 7,],
#             [2, 5, 8],
#             [3, 6, 9]]

# ### Brute force:
# matrix_t = [ [matrix[0][0], matrix[1][0], matrix[2][0]],
#              [matrix[0][1], matrix[1][1], matrix[2][1]],
#              [matrix[0][2], matrix[1][2], matrix[2][2]]  ]


## Algorithmically

def transpose(matrix)
  matrix_t = []
  [0, 1, 2].each do |n|
    new_array = []
    [0, 1, 2].each do |m|
      new_array << matrix[m][n]
    end
    matrix_t << new_array
  end
  matrix_t
end


matrix = [
          [1, 5, 8],
          [4, 7, 2],
          [3, 9, 6]
        ]

new_matrix = transpose(matrix)

p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]
