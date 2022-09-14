# when sorting strings in an array, know that items are organized by their
# order in ASCII not their length
['arc', 'bat', 'cape', 'ants', 'cap'].sort

# what will the following return? Here we are comparing arrays to one another
[['a', 'cat', 'b', 'c'], ['b', 2], ['a', 'car', 'd', 3], ['a', 'car', 'd']].sort
# Note that Array#<=> compares indexes in the arrays
# if any result in the array <=> other_arr results to 1, 0, -1, nill itll return that

# If all the index comparisons in arr <=> other_arr return zero then
# Array <=> will compare the size of the arrays and then return a value

# line 6 returns this:
[['a', 'car', 'd'], ['a', 'car', 'd', 3], ['a', 'cat', 'b', 'c'], ['b', 2]]
