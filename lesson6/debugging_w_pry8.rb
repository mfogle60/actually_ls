# this is our first file on how to debug with pry. Take the following example:

# write a method that given an array of integers, returns a new array
# containing only odd numbers that are less than or equal to 15, or multiples of 3.

require 'pry'

def select_nums(arr)
  new_arr = []

  arr.each do |i|
    if i.odd? && i <= 15 || i % 3 == 0
      new_arr << i
    end
    binding.pry # this is here so I can control the loop and look at each iteration
  end
  new_arr
end

p select_nums([1, 2, 5, 6, 9, 12, 15, 17, 19, 21]) == [1, 5, 9, 15, 21] # false
p select_nums([6, 12, 18]) == [] # false
# select_nums([3, 5, 7, 11, 15, 21]) == [3, 5, 7, 11, 15, 21] (true)

# How can we use pry in order to find the bug?

# **Remember that pry allows us to access variables within context (scope)**
