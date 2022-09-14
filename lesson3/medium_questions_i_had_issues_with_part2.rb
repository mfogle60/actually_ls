# Question 2) from part 2

# Let's take a look at another example with a small difference in the code:

a = 42
b = 42
c = a

puts a.object_id
puts b.object_id
puts c.object_id

# They all point at the same object, numbers are immutable, so you always
# point at the same object

# ==============================================================================
# Question 3
# Let's call a method, and pass both a string and an array as arguments and
# see how even though they are treated in the same way by Ruby, the results can be different.

# Study the following code and state what will be displayed...and why:

def tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga" # this does not mutate the string, so we point to diff object
  puts "Here is our string in the method: #{a_string_param} and here is its object id: #{a_string_param.object_id}"
  an_array_param << "rutabaga" # this definitely mutates the array
  puts "here is our array in the method #{an_array_param} and here is its object id: #{an_array_param.object_id}"
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string} here is its object id: #{my_string.object_id}"
puts "My array looks like this now: #{my_array} and here is its object id: #{my_array.object_id}"

# So += does not mutate the object, it creates a new object
puts "=========================================================================="
# ==============================================================================
# Question 4)
# To drive that last one home...let's turn the tables
# and have the string show a modified output,
# while the array thwarts the method's efforts to modify the caller's version of it.

def tricky_method_two(a_string_param, an_array_param)
  a_string_param << 'rutabaga' # first param will be mutated
  puts "Object id of our string in the method  #{a_string_param.object_id}"
  an_array_param = ['pumpkins', 'rutabaga'] # second will not mutate our parameter
  puts "Object id of our array in the method: #{an_array_param.object_id}"
end

my_string = "pumpkins"
puts "Object id prior to passing into method: #{my_string.object_id}"
my_array = ["pumpkins"]
puts "Object id prior to passing into method: #{my_array.object_id}"
tricky_method_two(my_string, my_array)

# tricky_method_two returns the following:
# my_string = 'pumpkinsrutabaga'
# my_array = ["pumpkins"]

puts "My string looks like this now: #{my_string} and the object id is: #{my_string.object_id}"
puts "My array looks like this now: #{my_array} and the object id is: #{my_array.object_id}"

# ==============================================================================
# Question 5)
# Depending on a method to modify its arguments can be tricky:
def tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param << "rutabaga"
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"


# IMPORTANT!!! I did not know that you can actually return multiple items at the
# same time, all in one line! Like on line 92

# I also did not know that you can store multiple return values from method
# invocations into multiple variables like I did on line 98
