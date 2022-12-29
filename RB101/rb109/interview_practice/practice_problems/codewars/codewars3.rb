

def solution(str1, str2)
  str1.scan(str2).length
end


p solution('abcdeb','b') == 2
p solution('abcdeb', 'a') == 1
p solution('abbc', 'bb') == 1