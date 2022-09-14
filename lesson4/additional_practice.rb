# 1) Given the array below
flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
# Turn this array into a hash where the names are the keys and the values are the positions in the array.

name_and_number = {}

flintstones.each do |item|
  name_and_number[item] = flintstones.index(item)
end
# => {"Fred"=>0, "Barney"=>1, "Wilma"=>2, "Betty"=>3, "Pebbles"=>4, "BamBam"=>5}

h = Hash.new
# second way:
flintstones.each_with_object(h) do |i, h|
  h[i] = flintstones.index(i)
end
# => {"Fred"=>0, "Barney"=>1, "Wilma"=>2, "Betty"=>3, "Pebbles"=>4, "BamBam"=>5}

# third way:
hash = Hash.new

flintstones.each_with_index do |item, index|
  hash[item] = index
end
# => {"Fred"=>0, "Barney"=>1, "Wilma"=>2, "Betty"=>3, "Pebbles"=>4, "BamBam"=>5}

**P: Turn array to a hash**
#    - make names the keys
#    - and values will be indexes of the positions of the names
# Input: Array
# Output: Hash (keys, are names, and values are the indexes of names from array)

**Examples**
=begin
flintstones -> {"Fred": => 0, "Barney": => 1, "Wilma": => 2..}
=end

**Algorithm**
# Create an empty hash
# Take item from array, add it to hash as a key
#   - Take index from that item and add to hash as the value
# Last step: return hash

#) Add up all of the ages from the Munster family hash:
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

total = ages.values
total.sum # => 6147

# 3) In the age hash:
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

# remove people with age 100 and greater.

ages_less_than_100 = ages.select do |k, v|
  k if v < 100
end
# => {"Herman"=>32, "Lily"=>30, "Eddie"=>10}

#4) Pick out the minimum age from our current Munster family hash:
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

youngest = ages.select do |k, v|
  k if k == "Eddie"
end
# => {"Eddie"=>10}

# 5) In the array:
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
# Find the index of the first name that starts with "Be"

flintstones.each_with_index do |item, index|
  if item.start_with?('Be')
    puts "The index of the first name that starts with 'Be' is #{index}"
  end
end

# 6) Amend this array so that the names are all shortened to just the first three characters:
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

# we use .map to transform
shortened_flintstones = flintstones.map do |item|
  item.slice(0..2)
end
# =>  ["Fre", "Bar", "Wil", "Bet", "Bam", "Peb"]

# 7) Create a hash that expresses the frequency with which each letter occurs in this string:
statement = "The Flintstones Rock"

# we are gonna use map because we want new values from our enumerable


def letters_of_string(str)
  letters = ['T', 'h', 'e', 'F', 'l', 'i', 'n', 't', 's', 't', 'o', 'e', 'R', 'c', 'k']

  letters.select do |letter|
    letter if letter == str
  end
end

divided = statement.chars

h = Hash.new

divided.each_with_object(h) do |item, h|
  h[item] = divided.count(item) if letters_of_string(item)
end


# ex:
# { "F"=>1, "R"=>1, "T"=>1, "c"=>1, "e"=>2, ... }


# 8) What happens when we modify an array while we are iterating over it? What would be output by this code?

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.shift(1)
end
# => [3, 4]

**problem breakdown**:
# First iteration:
#   - .each obviously begins looping with the index 0
#   - 1 gets output to the screen
#   - and then 1 is removed from the arr, causing us to have [2, 3, 4]
# BUT in the SECOND iteration, .each obviously has to continue onto index 1 not 0
#   - So, because our index for the iteration is 1, and our arr looks like this:
#     [2, 3, 4] then what gets output to the screen is 3, because its index is 1
#   - After 3 is output to the screen, the first item of the array gets removed
#     so 2 is removed and our arr is [3, 4]
# LOOPING IS STOPPED because our current array only has a length of 2 with
#     indexes of 0, and 1 respectively.


# What would be output by this code?

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.pop(1)
end
# => [1, 2]

** code breakdown**
# First iteration:
#   - 1 gets output to the screen
#   - .pop(1) deletes the trailing element from the arr, so 4 gets deleted and
#     we are left with an array that looks like this: [1, 2, 3]
# Second iteration:
#   - 2 gets output to the screen
#   - 3 gets deleted from the arr, so arr looks like this: [1, 2]
# Third iteration
#   - Our .each method stops iterating over the collection because we already
#     were on this index in the second iteration, so we're done

# 9) As we have seen previously we can use some built-in string methods to change the case of a string.
#    A notably missing method is something provided in Rails, but not in Ruby itself...titleize.
#    This method in Ruby on Rails creates a string that has each word
#    capitalized as it would be in a title. For example, the string:

words = "the flintstones rock"
# would be..
words = "The Flintstones Rock"

# Write your own version of the rails titleize implementation.

words_array = words.split

cap_words_array = String.new

words_array.each_with_object(cap_words_array) do |item, str|
  str.concat(' ', item.capitalize)
end
# => "The Flintstones Rock"

# 10) Given the munsters hash below
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

# Modify the hash such that each member of the Munster family has an additional
# "age_group" key that has one of three values describing
# the age group the family member is in (kid, adult, or senior).
# Your solution should produce the hash below

{ "Herman" => { "age" => 32, "gender" => "male", "age_group" => "adult" },
  "Lily" => {"age" => 30, "gender" => "female", "age_group" => "adult" },
  "Grandpa" => { "age" => 402, "gender" => "male", "age_group" => "senior" },
  "Eddie" => { "age" => 10, "gender" => "male", "age_group" => "kid" },
  "Marilyn" => { "age" => 23, "gender" => "female", "age_group" => "adult" } }

  # We have a hash, our keys point to another hash
  # Add a new key value pair to every key
  #   - iterate over each key

  Note: a kid is in the age range 0 - 17, an adult is in the range 18 - 64 and a senior is aged 65+.

# put ages in an array, compare the age of the individual, depending on how old they
# are, return something
def compare_ages(value)
  m_ages = 32, 30, 402, 10, 23
  m_ages.each do |i|
    if value > 0 && value <= 17
      return 'kid'
    elsif value > 17 && value <= 64
      return 'adult'
    else
      return 'senior'
    end
  end
end

# need to merge a hash I create with
munsters.map do |key, value|
  munsters[key]['age_group'] = compare_ages(munsters[key]['age'])
end
=> { "Herman"=>{"age"=>32, "gender"=>"male", "age_group"=>"adult"},
     "Lily"=>{"age"=>30, "gender"=>"female", "age_group"=>"adult"},
     "Grandpa"=>{"age"=>402, "gender"=>"male", "age_group"=>"senior"}, 
     "Eddie"=>{"age"=>10, "gender"=>"male", "age_group"=>"kid"},
     "Marilyn"=>{"age"=>23, "gender"=>"female", "age_group"=>"adult"}}
