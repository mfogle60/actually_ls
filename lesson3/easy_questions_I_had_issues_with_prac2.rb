# 1) To check if a key is in a hash do this:
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

# first way
ages.include?('Spot')

# second
ages.member?('Spot')

# third
ages.key?('Spot')

# 2) To add more hash elements to hash
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10 }

additional_ages = { "Marilyn" => 22, "Spot" => 237 } # add these to the hash

ages.merge(additional_ages) # .merge! is also an option if we want destructive

# 3) To see if a word is in a string
advice = "Few things in life are as important as house training your pet dinosaur."

# see if Dino is in the string
advice.include?('Dino')
# second way
advice.match?("Dino")

# Note that this is not a perfect solution, as it would match any substring with Dino in it.

# 4) How to get a substring from a string
# We can actually match more that just one sub string from a string, look
about_me = 'I am actually from the US of A.'

if about_me.match?('US of A')
  about_me['US of A'] = 'United States of America'
else
  puts "Sorry, that is not a valid option."
end

puts about_me

# 5) Show an easier way to write this array:
flintstones = ["Fred", "Barney", "Wilma", "Betty", "BamBam", "Pebbles"]

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles) # here it is

# 6) How to add items to an array
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles) # here it is
# add 'Dino' to our array
flintstones << 'Dino' # first way
flintstones.push('Dino') # second way
flintstones.append('Dino') # third way
flintstones.concat(['Dino']) # fourth way

# 7) How can we add multiple items to our array at one time?
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles) # here it is

# How can we add multiple items to our array? (Dino and Hoppy)
flintstones.concat(['Dino', 'Hoppy']) # first way
flintstones.push('Dino', 'Hoppy') # second way
flintstones.append('Dino', 'Hoppy') # third way, remember we can also use
# prepend to give the opposite effect of append
# so you can't add multiple items to an array with <<

# 8) Here's how to shorten a string
advice = "Few things in life are as important as house training your pet dinosaur."
# what the String#slice method does is that is removes the first instance of the
# object that we pass in as an arg
# it will return whatever is deleted
# Review the String#slice! documentation, and use that method to make the return value
# "Few things in life are as important as ". But leave the advice variable as "house training your pet dinosaur.".
advice.slice!('Few things in life are as important as')
advice.slice!(0, advice.index('house')) # another way to do it
# => "Few things in life are as important as"

# As a bonus, what happens if you use the String#slice method instead?
# .slice is not destructive so our would remain unchanged

# 9)Write a one-liner to count the number of lower-case 't' characters in the following string:
statement = "The Flintstones Rock!"
statement.count('t')
