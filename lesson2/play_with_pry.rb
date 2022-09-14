require "pry" # add this to use Pry

counter = 0

loop do
  counter += 1
  break if counter == 1 # in this program we will actually break before we hit binding.pry
  binding.pry # execution will stop wherever binding.pry is
end

counter = 0

loop do
  counter += 1
  binding.pry # execution will stop here, so counter will still stop when count == 1
  break if counter == 5
end

puts counter
