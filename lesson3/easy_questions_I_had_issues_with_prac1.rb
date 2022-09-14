# PRACTICE 1 
# 1) When we want to substitute a word in a string, either use gsub!(to mutate)
# or sub to create a new object

name = 'marcos andres ramirez'
name.gsub!('marcos', 'Marcos') # mutates original object
name = name.sub('andres', 'ANDRES') # makes a new object

# 2) the difference between the two methods:
# #.delete_at(1) deletes the value at the index it provides
# #.delete(1) deletes any value that matches the method arg

# 3) To detemine if a number belongs to a range
# for example to see if 42 is between 10 and 100
(10..100).include?(42) # => true
(10..100).cover?(42)

# 4) To put text in front of other text..
# one way
famous_words = "seven years ago..."
famous_words.prepend("Four score and ")
# second way
"Four score and " + famous_words
# third way
"Four score and " << famous_words

# 5) If we're given a hash
flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }

# turn the hash into an array containing only two elements, barney's name and number
flintstones.assoc("Barney") # => ["Barney", 2]
# so .assoc() will not mutate the hash, it just returns a new array, it takes
# a key as the arg, and will return the key it's value as an array
# IMPORTANT, .rassoc is another method that will do the same thing as .assoc,
# but it takes a value as the arg
