# These are the questions I got wrong

# Question 7)

# Read the below statements regarding each and identify all the
# statements which are correct. You may assume that the block doesn't terminate the method prematurely.

# I chose:
# A) If you call each with a block on an array that contains seven elements,
#    the block will always execute seven times
# C) When each is called with a block on an array, it returns the array object that it was called on.

# Correct answers: Only C was correct

# Why A was wrong:
# If you mutate the object used to call each from within your block,
# the block may run fewer than 7 times. Recall that it is not recommended to
# mutate an object that you are iterating over because of the potentially unpredictable behavior.

# ===================================================================

# Question 8) Read the below statements regarding select and identify all the statements which are correct.

# I selected:

# B) When select is called with a block, it evaluates the truthiness of the block's return value.

# C) If select was called on an array with a block that returned a truthy value on each iteration, the original array would be returned.

# D) When select is called with a block on a hash it returns a new hash.

# Correct answers: Only B & D are right

# Why C was wrong:
#  The return value in this case would be a NEW array containing all of the items from the original array.

# ====================================================================

# Question 17) Carefully examine the following code example.
# Based on your observations of the code example, select all statements below which are true.

flavors = ['chocolate', 'strawberry', 'mint', 'vanilla']
flavors.reject { |flavor| puts flavor }

# I selected: C

# C) The method called on the flavors array returns a reference to the original array.

# The correct answer:
# D) The method called on the flavors array considers only the truthiness of the block's return value.

# Why C) was wrong:
# Like Array#select, Array#reject is only interested in the truthiness
# of the block's return value, though in the case of reject it returns
# the items for which the block is not true, or in other words is falsy.
# (Also because .reject returns a new array, not the original)
