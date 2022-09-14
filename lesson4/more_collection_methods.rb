# First we are going to practice with the Enumerable#any? method
# Remember that this method will return true or false
# It'll return true if any of the elements return true
# 1)

arr = [1, 2, 3, 4]

arr.any? {|element| element == 2}
# => true

# 2)
counter = 0

arr = Array.new

until counter == 5
  arr << rand(1..101)
  counter += 1
end
# [83, 16, 56, 45, 22]

arr.any? {|i| i > 25}
# => true

# IMPORTANT: The second alternative of what we can do is adding a pattern to
# our any? as an argument. Example:

arr = %w(hi There)
arr.any?(/h/)
# => true
arr.any?(/There/)
# => true

# we can also not provide a block and implicitly will provide its own block { |obj| obj }
arr = [22, 101, 998.7]
arr.any?(998.7)
# => true

countries_n_caps = {
  sweden:  'Stockholm',
  finland: 'Helsinki',
  norway:  'Oslo'
}

# any? works with hashes too
countries_n_caps.any? do |k, v|
  k == :sweden
end
# => true

# ==================================
# practice with Enumerable#all?
# remember that every element in collection must return true or the method
# returns false

arr = [10, 55, 23]

arr.all? { |e| e > 50}
# => false

# create a method that will add integers to an array
# the integers in the array must all be greater than a number we enter
# depending if the number we provide is greater than the numbers of the Array
# will we get true or false, true if it is, false it isnt
def greater_than?(n)
  arr = Array.new
  counter = 1
  while counter > arr.size  # counter = 1 and arr = 0
    break if arr.size == 5
    arr << rand(1..101) # 1 to 101 in array
    counter += 1
  end

  arr.all? { |e| n > e  }
end
# => returns true or false

# make a hash problem that uses Enumerable#any?
# enter a city, see if that city is in a random country
def city_in_collection?(city)
  random_country = %w(sweden america canada).sample.to_sym

  ran = rand(0..2) # gives us the indexes from 0 to 2
  countries = {
    sweden: %w(Stockholm Solna Bergshamra),
    america: %w(Austin Boston Portland),
    canada: %w(Ottawa Vancouver Toronto)
  }
  puts "ran = #{ran}, country is #{random_country} and the city: #{city}"
  # countries[:sweden] => ['Stockholm', 'Solna', 'Bergshamra']
  countries[random_country].any? do |element| # does any iterate thru array
    city == element
  end
end
# ===============================
**Important**
# With any? the block will get the return value of the block,
# and depending on that will the method return true or false. Ex:

collection = [nil, 'Hi there!', false]

collection.any?{ |e| e} # => true
# BUT if we do:
collection.any?{ |e| puts e } # => false
# false is returned because puts returns nil each time, the block returns
# nil so the block returns false

# ======================================
# Enumerable#each_with_index

arr = %w(zero first second third fourth fifth)

# remember that the second block parameter is the index number
arr.each_with_index do |element, index|
  puts "#{element} has an index of #{index}"
end
# => zero has an index of 0
# => first has an index of 1
# => second has an index of 2
# => third has an index of 3
# => fourth has an index of 4
# => fifth has an index of 5
# => ["zero", "first", "second", "third", "fourth", "fifth"]
**Remember**
# each_with_index returns the original caller
# Just like with .each the return value of the block is ignored

countries = %w(Sweden America Hungary Chile Argentina)

countries.each_with_index do |element, index|
  puts "The index #{index} has a value of #{element}."
end

# Enumerable#each_with_index (but on a hash collection)

states_n_cities = {
  texas: ['El Paso', 'San Antonio', 'Houston'],
  california: ['San Diego', 'Los Angeles', 'Berkley'],
  florida: ['Miami', 'St.Petersburg', 'Tampa Bay']
}

# grabs the key and value and puts them in one array, and then grabs the index too
states_n_cities.each_with_index do |k_n_e, index|
  p "Our array is: #{k_n_e} and it has an index of: #{index}"
end

# "Our array is: [:texas, [\"El Paso\", \"San Antonio\", \"Houston\"]] and it has an index of: 0"
# "Our array is: [:california, [\"San Diego\", \"Los Angeles\", \"Berkley\"]] and it has an index of: 1"
# "Our array is: [:florida, [\"Miami\", \"St.Petersburg\", \"Tampa Bay\"]] and it has an index of: 2"
# The caller is returned with each_with_index

# Remember the quirk we can use with .each_with_index
# This quirk will grab the key, and the value separately
states_n_cities.each_with_index do |(key, value), index|
  # we can actually just print out the keys, or the values, or both along with the index
  puts "The key is #{key} and the value is #{value} and its in index #{index}"
end

# ====================================================

# Enumerable.each_with_object
#   - There are two parameters for the block with this method
#       - The first is the element we will iterate thru in the collection
#       - The second is the object we want to use to store the elements we will
#         iterate through
#   - iterates the given block for each element with an
#     arbitrary object given, and returns the initially given object.
counties_of_tx = Array.new # empty array

counties = 'El Paso', 'Beverly Hills', 'Orange', 'Val Verde', 'Kendall'

counties.each_with_object(counties_of_tx) do |element, counties_of_tx|
  if element == 'El Paso' || element == 'Val Verde' || element == 'Kendall'
    counties_of_tx << element
  end
end
# This method returns the object that we filled and its elements, in this case:
# =>  ["El Paso", "Val Verde", "Kendall"]

# Another practice problem
hash = Hash.new

impo = {
  truthy: ['Integers', 'Strings', 'True', 'Floating points', 'Comparison operators'],
  falsey: ['Nil', 'False']
}

impo.each_with_object(hash) do |(key, value), hash|
  # trying to put impo into hash
  hash[key] = value
end
# => {:truthy => ['Integers', 'Strings', 'True', 'Floating points', 'Comparison operators'], :falsey => ['Nil', 'False']}

impo.each_with_object(hash) do |(key, value), hash|
  if key == :truthy # if one of the keys is `:truthy`
    hash[key] = value # then we want to fill up our hash with the keys and values of :truthy
  end
end
# => {:truthy=>["Integers", "Strings", "True", "Floating points", "Comparison operators"]}

# =========================================================

# Enumerable.first

**Can take an argument, or no argument**
# - If no argument is provided then it returns the first element of the collection
#   or nil if there is no valid element
# - If an argument is provided then it returns the first element(s) of the collection

**With no argument**

places_visited = %w(Mexico Canada Europe Alaska)

places_visited.first
# => "Mexico"

places_visited.first(3)
# => ["Mexico", "Canada", "Europe"]

**Note: if the collection is
  empty then first signature/form, `collection.first` `nil`
  gets returned. If the second signature form, `collection.first(n)`
  then what gets returned is an empty array**

items = []
items.first(3)
# => []

# we can call Enumerable#first on hashes, but it is not too common.
# Enumerable#first is most often used on arrays

h = {
  states: ['Texas', 'California', 'New Mexico'],
  cities: ['El Paso', 'San Diego', 'Las Cruces']
}

h.first
# => [[:states, ["Texas", "California", "New Mexico"]]]

# ====================================================

# Enumerable#include?

# Does not take a block, just an argument
# The object we are looking for as argument
# If the argument we pass into caller is in the collection then `True`
#   - If it is not in the collection then `False` is returned is returned

# Enumerable#include? is an alias for Hash#key?
#   - Though many Rubyists prefer to use Hash#key? because its intention is
#     much more explicit

# Important note: If you are trying to see if a value exists in a hash,
# then it is best to use Hash#value? over Hash#values
# instead of trying to call Hash.values.include?(object)**
# Example:

countries = {
  sweden: 'Stockholm',
  canada: 'Ottawa',
  england: 'London'
}

countries.value?('Ottawa')
# => true

countries.value?('Munich')
# => false

# ============================================

# Enumerable#partition

# What this method does is that it divides our collection into two arrays

# - The first array will be comprised of the elements that returned true
#     from our block, and in the second array it will be all the elements that
#     returned false from our block.

# So the first will be our true array, the second our false array

# If we provide no block, we get an enumerator returned

# IMPORTANT: We always get an array returned with partition

(1..6).partition { |v| v.even? }  #=> [[2, 4, 6], [1, 3, 5]]

long, short = { a: "ant", b: "bear", c: "cat" }.partition do |key, value|
  value.size > 3
end
# => [[[:b, "bear"]], [[:a, "ant"], [:c, "cat"]]]

animals = %w(Collie Tabby Calico Retriever)
# separate into two arrays, one with dogs, other with cats

dogs, cats = animals.partition do |d|
  d if d == 'Collie' || d == 'Retriever'
end
# => [["Collie", "Retriever"], ["Tabby", "Calico"]]
