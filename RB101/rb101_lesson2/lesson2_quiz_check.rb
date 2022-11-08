### Question 19
def name
  "George"
end

x = "Lisa"



loop do
  puts name
  break

end

## >>> Returns "Lisa "


#### Check: Is it because the variable is assigned before the method?
#### We can check by simply assigning the variable AFTER the method.
## >>> This still Returns "Lisa". This means that the order that the variable
## >>> and the the method are defined is irrelevent 

#### Check: Can the block access the method? Check by renaming the method and 
####        calling it within the block
## >>> This returns "George", so we know it can access the method from within the block.





































### Question 14

# ----------------- ##### Original ------------------- #
# def extend_greeting(greeting)
#   greeting + " there"
# end

# greeting = "hi"
# extend_greeting(greeting)

# puts greeting
# ---------- ##### output is hi

# ----------------- ##### Option 1 ------------------- #
# def extend_greeting(greeting)
#   greeting += " there"
# end

# greeting = "hi"
# extend_greeting(greeting)

# puts greeting
# ------##### Output is hi

# ----------------- ##### Option 2 ------------------- #
# def extend_greeting(greeting)
#   greeting + " there"
# end

# greeting = "hi"
# greeting = extend_greeting(greeting)

# puts greeting
# ------##### Output is hi there

# ----------------- ##### Option 3 ------------------- #
# def extend_greeting(greeting)
#   greeting + " there"
# end

# greeting = "hi"
# puts extend_greeting(greeting)

# ------##### Output is hi there

# ----------------- ##### Option 4 ------------------- #
# def extend_greeting(greeting)
#   greeting << " there"
# end

# greeting = "hi"
# extend_greeting(greeting)

# puts greeting
# ------##### Output is hi there

