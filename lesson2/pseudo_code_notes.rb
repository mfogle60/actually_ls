#pseudo-code is meant for humans to read
#it's not meant for computers to read, so theres no set format to follow
#we have an example of pseudo-code for some method
#that iterates over a collection-
#of numbers and returns the greatest number
#-------------------------------------------------------------------------------
=begin #This is called CASUAL pseduo-code

Given a collection of integers.

Iterate through the collection one by one.
  - save the first value as the starting value.
  - for each iteration, compare the saved value with the current value.
  - if the saved value is greater, or it's the same
    - move to the next value in the collection
  - otherwise, if the current value is greater
    - reassign the saved value as the current value

After iterating through the collection, return the saved value.
=end
#-------------------------------------------------------------------------------
#the goal of pseudo-code is to load the problem in our head first, before any
#coding

#we need to think in a logical manner, and to understand the problem before we
#code, because if we just code first we will just think syntactically before
#truly understanding the problem

#MOST IMPORTANT: Instead of thinking about the logic and dissecting the problem,
#you're searching for specific language syntax issues to please the interpreter,
#which has nothing to do with the logical aspect of solving a problem.
#-------------------------------------------------------------------------------
#here is what our pseudo-code written that is written in a better format looks
#like: It is called FORMAL pseudo-code
=begin
START

Given a collection of integers called "numbers"

SET iterator = 1
SET saved_number = value within numbers collection at space 1

WHILE iterator <= length of numbers
  SET current_number = value within numbers collection at space "iterator"
  IF saved_number >= current_number
    go to the next iteration
  ELSE
    saved_number = current_number

  iterator = iterator + 1

PRINT saved_number

END
=end

#last tips: 
#You don't need to use pseudocode for every bit of code you write, especially
#once you get down to the individual method level. However, it's a good idea to
#always use it here in this course and the associated Small Problem exercises.
#This will help you overcome problems in the short term, and prepare you for
#the interview assessment later on.
