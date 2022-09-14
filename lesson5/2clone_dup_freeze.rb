# both dup and clone work pretty much the same way
# they allow us to copy the objects within a collection
# a copy is made of the collection, but the objects are
# references to the original object, so if we mutate them then we mutate the orig.


# it is important to know that objects within arrays are the objects to that array

# Which is why, when we use clone or dup on a collection, if we mutate
# any of the items from the original in the copy, this is due to the fact that
# these objects are shared, so we can do things to the copy's data structure,
# and nothing will happen to the original's data structure, but if we do something
# to the objects that are references to the original ds's references then we will
# see a change, ex:

countries = %w(America Canada Mexico Spain)

c = countries.clone

c.each do |i|
  i.upcase!
end

c # => ["AMERICA", "CANADA", "MEXICO", "SPAIN"]
countries # => ["AMERICA", "CANADA", "MEXICO", "SPAIN"]

# same thing w/ dup

countries = %w(America Canada Mexico Spain)

c = countries.dup

c.each do |i|
  i.upcase!
end

c # => ["AMERICA", "CANADA", "MEXICO", "SPAIN"]
countries # => ["AMERICA", "CANADA", "MEXICO", "SPAIN"]

#**But if we add something to our copy array, or our original after we do clone,
# then either array won't see a change**

# Ex:

countries = %w(America Canada Mexico Spain)

c = countries.clone

c.push('England')

c # => c # => ["AMERICA", "CANADA", "MEXICO", "SPAIN", "England"]
countries # => ["AMERICA", "CANADA", "MEXICO", "SPAIN"]

# **Practice with freezing**

# We freeze by calling freeze on the collection that we want to preserve

arr1 = ["a", "b", "c"].freeze # freeze the collection first
arr2 = arr1.clone #clone the collection to arr2
arr2 << "d" # try to change it, we cant
# => RuntimeError: can't modify frozen Array

states_abbreviation = {
  ok: 'oklahoma',
  tx: 'texas',
  nm: 'new mex',
  az: 'azona'
}.freeze # because its frozen, it won't let us modify the hash

s_a = states_abbreviation.clone

s_a.each_value do |v| # doesnt work
  v['azona']= 'arizona'
end

# freeze prevents original objects from being mutated
# we can create a new object, there's nothing stopping from doing that, for ex:
name = 'Mark F'.freeze

name += 'Ramirez' # so we can do this bc we're lit. creating a new object not mutating

# but we cannot mutate the original object
name = 'Mark F'.freeze
name << 'Ramirez'
# an error will be raised


my_arr = [[18, 7], [3, 12]].each do |arr|
inner = arr.each do |num|
  if num > 5
    puts num
  end
end
p inner 
end
