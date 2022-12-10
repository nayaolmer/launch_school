matrix = [[1, 2, 3],
          [4, 5, 6],
          [7, 8, 9]]

matrix_t_ans = [[1, 4, 7],
                [2, 5, 8],
                [3, 6, 9] ]

### Brute force:
matrix_t = [ [matrix[0][0], matrix[1][0], matrix[2][0]],
             [matrix[0][1], matrix[1][1], matrix[2][1]],
             [matrix[0][2], matrix[1][2], matrix[2][2]]  ]


matrix[0][0] = matrix[0][0]
matrix[0][1], matrix[1][0] = matrix[1][0], matrix[0][1]
matrix[0][2], matrix[2][0] = matrix[2][0], matrix[0][2]
matrix[1][1] = matrix[1][1]
matrix[1][2], matrix[2][1] = matrix[2][1], matrix[1][2]
matrix[2][2] = matrix[2][2]

[1, 2].each do |m|
  n = 0
  matrix[n][m], matrix[m][n] = matrix[m][n], matrix[n][m]
end

[2].each do |m|
  n = 1
  matrix[n][m], matrix[m][n] = matrix[m][n], matrix[n][m]
end



    00 00 = 00 00
    01 10 = 10 01
    02 20 = 20 02

    n ====== 1
    11 11 = 11 11
    12 21 = 21 12

    n ===== 2
    22 22 = 22 22


