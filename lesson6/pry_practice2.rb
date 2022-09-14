require 'pry'

puts "Enter a number, either 1 or 2."
number = gets.chomp

binding.pry # so this will give us the ability to stop the program right here
# we will also be allowed to check what value number is pointing at.
# We can even perform methods on number
# the arrow `=>` in pry is where the program stopped at..
# you can even change number's value
if number == 1
  puts "You picked 1."
elsif number == 2
  puts "You picked 2."
else
  puts "Invalid option!"
end

# to exit pry one way to do it is by typing `exit-program`
