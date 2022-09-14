require 'pry'
require 'pry-byebug'
# pry-byebug is a rubygem
# It extends the capabilities of pry by adding some additional commands:
# next, step, continue,

# There are similar gems that exist, like: pry-nav and pry-debugger

# let's practice stepping over code with pry-byebug
def double_number(num)
  num + 2
end

def double_evens(arr)
  arr.map do |num|
    binding.pry 
    new_num = num.even? ? double_number(num) : num # we are just settting every element to a new variable `new_num`
  end
end

p double_evens([1, 2, 3, 4, 5]) == [1, 4, 3, 8, 5] # false

# p double_evens([1, 2, 3, 4, 5]) == [1, 4, 3, 6, 5] # true

# the `next` keyword allows us to go to the next iteration of the loop
# in the above example it allows us to see the next value of `num`

# we can use the keyword `continue` which is part of `pry-byebug` it also works like `next`

# Identify what the difference is between `continue` and `next`
#   - Continue goes to the next item in the collection/program, so it
#     does not even worry about the iteration anymore..

# We can also use the keyword `step` which allows us to step into another method

# What is meant between the phrases `step-over` and `step-into`?
# **Step-over code means that we use the `next` keyword and we can literally step over the lines of code**
# **Step-into code literally means that we change into another object**
#   - for example we can step into another method if we so please to..
