# Do not rush these practice problems, take your time
# Only look at the code or ruby docs to answer the problems

# 1) What is the return value of the select method below? Why?
[1, 2, 3].select do |num|
  num > 5
  'hi' # => this will always be truthy so the array will the caller of .select
end
# => [1, 2, 3]
# select performs selection based on the truthiness of the block's return value.
# In this case the return value will always be 'hi', which is a "truthy" value.
# Therefore select will return a new array containing all of the elements in the original array.

# Another ex:
arr = [2, 4, 6, 8]

arr.select do |evens|
  evens.even?
end
# Since every element in the array returns true then the whole array is truthy!
# and therefore all of it will be returned

# 2)How does count treat the block's return value? How can we find out?
['ant', 'bat', 'caterpillar'].count do |str|
  str.length < 4 # be true or false
end
# => 2
# with count, (when we provide a block) if the block returns true, count
# will count all the times it returns true
# block basically says, every time enum is < 4 in length we count that true
# block returns 2

# 3) What is the return value of reject in the following code? Why?
[1, 2, 3].reject do |num|
  puts num # this returns nil, so our collection will be [1, 2, 3]
end
# => [1,2,3]

# our new array will basically be filled with elements from our collection
# that returned false or nil when passed in our block

# 4) What is the return value of each_with_object in the following code? Why?
['ant', 'bear', 'cat'].each_with_object({}) do |value, hash|
  hash[value[0]] = value # whatever gets returned will be put into object param
end
# => {'a': 'ant', 'b': 'bear', 'c': 'cat' }

# each_with_object returns the object that we provided as an argument
# we are provided with:
#   - an array collection w/ 3 elements
#   - desired outcome: {'ant': 'ant'}
#   - value[0] is 'ant'[0] => 'a'

# 5) What does shift do in the following code? How can we find out?
hash = { a: 'ant', b: 'bear' }
hash.shift
# => {:a, 'ant'}

# 1) Check out the appropriate documentation
# 2) When shift is used on a has it removes the first key-value entry
#    and returns that deleted value and key

# 6) What is the return value of the following statement? Why?
['ant', 'bear', 'caterpillar'].pop.size

# => 11
# => pop returns 'caterpillar' and size returns the length of caterpillar

# - first lets see what Array#pop does
#     if I am not mistaken pop gets rid of the last element in collection

# - Array#pop delets the trailing element in a col. and can do one of two things:
#     1) Return an object or nil
#     2) Or when given an argument, it will return a new array,
#        which will be filled with as many elements as mentioned by the arg
#          - Know that if we provide an arg, it will delete the last n elements
#          - If n is positive and out of collection range it deletes org. collection
#             and returns a new array
#          - Ex:
a = [:foo, 'bar', 2]
a.pop(2) # => ["bar", 2]

# size gives us length of the caller

# 7) What is the block's return value in the following code? How is it determined?
# Also, what is the return value of any? in this code and what does it output?
[1, 2, 3].any? do |num|
  puts num # stops outputting at the element that returns true in the block
  num.odd? # but this looks at [1, 2, 3] not [nil, nil, nil]
end
# 1 (output to screen)
# => true

# What is also interesting here is any? stops iterating after this
# point since there is no need to
# evaluate the remaining items in the array; therefore,
# puts num is only ever invoked for the first item in the array: 1.

# 8) How does take work? Is it destructive? How can we find out?
arr = [1, 2, 3, 4, 5]
arr.take(2)
# => [1, 2]

# Array#take takes an integer argument, and returns that many number of
# elements and puts them in a new array.
# So, take returns a new array

# 9) What is the return value of map in the following code? Why?
{ a: 'ant', b: 'bear' }.map do |key, value|
  if value.size > 3
    value
  end
end
# => [nil, "bear"]

# in the case of 'ant' it returned false, so value wasn't returned
# so nil is added to the array

**EXTREMELY IMPORTANT**
# When none of the conditions in an if statement evaluates as true,
# the if statement itself returns nil.
# That's why we see nil as the first element in the returned array.

# 10) What is the return value of the following code? Why?
[1, 2, 3].map do |num|
  if num > 1
    puts num # returns nil
  else
    num # 1 is put into arr
  end
end
# => [1, nil, nil]

# map takes what is returned from the block and puts it into an arr
# if an if condition is false, nil is returned
