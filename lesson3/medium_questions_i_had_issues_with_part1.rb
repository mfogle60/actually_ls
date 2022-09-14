# Question 1)
# For this practice problem, write a one-line program that
# creates the following output 10 times, with the subsequent line indented 1 space to the right:

# The Flintstones Rock!

10.times {|n| (" " * n) + "The Flintstones rock!"}
# remember that Ruby does not know what to do when we add a string to a number,
# so it returns an error
# But ruby DOES know what to do when we multiply a string by a number, it returns
# copies of that string by however many times we multiply the string by
# ==============================================================================

# Question 2)
def factors(number)
  divisor = number
  factors = []
  begin
    factors << number / divisor if number % divisor == 0
    divisor -= 1
  end until divisor == 0
  factors
end

# refactor the method above so that it can gracefully handle the following:
# negatives, so that we can avoid an infinite loop AND 0 so that we do not get
# a divide by zero exception

def factors(number)
  divisor = number
  factors = []
  while number > 0
    factors << number / divisor if number % divisor == 0
    divisor -= 1
    break if divisor == 0
  end
  return "Sorry the value you entered is not valid." if number == 0 || number < 0
  factors
end


# Question 7

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

# does this method mutate the hash object munsters?
def mess_with_demographics(demo_hash)
  demo_hash.values.each do |family_member| # ohh, the .dot values method lets you access every value
    # family_member["age"] += 42
    # family_member["gender"] = "other"
    puts family_member
  end

# Let's take a look at another example with a small difference in the code:

a = 42
b = 42
c = a

puts a.object_id
puts b.object_id
puts c.object_id
end
