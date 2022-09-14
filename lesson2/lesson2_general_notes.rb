#remember that truthiness is not the same as the truth boolean object
#everything in Ruby that is not nil or false is truthy
#-------------------------------------------------------------------------------
#integer division is what Ruby does when you divide two integers togethers
#you'll never get a float from dividing two integers together, to get a float you
#need to divide a float by an int or two floats
#-------------------------------------------------------------------------------
#remember that if statments do return values!
=begin
answer = if true
           'yes'
         else
           'no'
         end
Kernel.puts(answer)       # => yes
=end
#-------------------------------------------------------------------------------
#remember that if statements/conditional expressions do not create their own
#variable scope! Any var created within one will be easily accessed outside of
#the expression!
#-------------------------------------------------------------------------------
#remember that there are two layers to problem solving:
#1.The logical problem domain layer
#2. The syntactical programming language layer
#pesudo-code helps us with the first
#-------------------------------------------------------------------------------
#the main issue with pseudo-code and the way we implemented it was that many
#problems wont be that easy so we cant just:
#1) write out the entire pseudo-code for all the program
#2) then format the pseudo-code into a more code-friendly manner
#3) then translate it into Ruby
#This won't be possible in many problems, we will have to use a piecemeal
#approach with pseudo-code if we are dealt with a more confusing problem
#becuase with pseudo-code remember we are almost just guessing with our logic
#-------------------------------------------------------------------------------
#For more sophisticated problems, we need to take a piecemeal
#approach to applying pseudo-code, then translating that to
#Ruby code to verify the logic is correct, then moving on to the next piece
#in the problem.
#Step by step, we can slowly load the problem into our brain,
#verifying the logic each step along the way.
#-------------------------------------------------------------------------------
#Actually drawing out your logic in your program with arrows
#is called imperative way to solve a problem(think of it like the necessary way)
#Not to be confused with the imperative way, the DECLARATIVE way to solve a
#problem is with the help of a method (like .each to iterate over an array)
#With our flowcharts we are always going to be imperative in our approach of
#looping rather than using a method to do it declaratively
#-------------------------------------------------------------------------------
#subprocesses allow us to maintain the high-level thought we need to properly
#write the flow of the logic in our program.
#-------------------------------------------------------------------------------
#How to approach using pseudo-code and flowcharts for our programs
=begin
1.Use high-level casual pseudo code, remember be general but capture the
entire, start to finish of the program down, use declarative syntax here
2.Then write down more formal pseudo-code and if we have to, include any
subprocesses in there. But obviously do not get into the subprocesses.
3.Write down our flowchart with our subprocesses, steps, whatever just
write imperative syntax here (except for our subprocesses, those we Write
in declarative syntax, remember we kind of want to general about them)
4. If we have any subprocesses, then we can write pseduo-code for them and a
flowchart to better write out the logic for them
=end
#-------------------------------------------------------------------------------
