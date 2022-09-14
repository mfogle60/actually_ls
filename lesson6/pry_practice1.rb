require "pry"
# insert binding.pry on the line where we want our program to stop running..
# here is an example

counter = 0

loop do
  counter += 1
  break if counter == 5 
  binding.pry # it will stop here..
end
