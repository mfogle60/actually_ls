
#time to practice our own pseudo-code
#casual pseduo-Code
#problem: a method that takes an array of strings, and returns a string that is
#all those strings concatenated together

#Get a collection of items
#Get each item one by one and add it to an empty variable

#begin formal pseudo-code
#START
#GET a collection of words from user
#SET a variable, "empty" to empty
#Grab every item in the collection and put it in empty
#PRINT empty
#END

#this program works too!
def single_string collection
  empty = ""
  collection.each do |word|
    if word == nil || word == false
      next
    else
      empty << word
    end
  end
  return empty
end

dogs = ["Patches ", false , "Osito "]
single_string(dogs)

#this program works too!
def words collect
  iterate = 0
  empty = ""
  #while iterate <= collect.size #this was the code that was preventing program
  #from working
  while true
    empty << collect[iterate]
    iterate +=1
    break if iterate == collect.size #I just added this line and it worked
  end
  return empty
end

dogs = ["osito ", "patches ", "carl "]
countries = ["Mexico ", "United States ", " Russia"]
puts words(countries)

#-------------------------------------------------------------------------------
#Problem number three for pseudo-Code
#The question: A method that takes an array of integers,
#and returns a new array with every other element from the original array,
#starting with the first element. For instance:

#CASUAL pseduo-code
=begin

-Give a collection of integers (positive or negative whole numbers)
-Set a variable evens = to remove the first item in the collection
-Set a variable index = to help you iterate over the collection
-skip the next item, the second one
-remove the next item in the collection and set it to evens
-skip the next item
-repeat this until you finish with the collection
print evens

=end

=begin
#here we write FORMAL pseudo-code

START

GET the collection from the user

SET evens = the new collection of integers from our original collection
SET index = set to zero, to help us iterate through collection

FOR every word in collection
  -IF the value is in an even spot in the collection
    -put in new var evens
  -ELSE
    - next
  END
  -Increase index by one
PRINT evens
END
=end

def evens parameter
  empty = [] # set to empty array
  index = 0
  for p in parameter
    if index.even?
      empty << p
    end
      index +=1
  end
  return empty
end
#-------------------------------------------------------------------------------
=begin
Next problem for pseudocode:

A method that determines the index of the 3rd occurrence of a given character
in a string. For instance, if the given character is 'x' and the string is
'axbxcdxex', the method should return 6 (the index of the 3rd 'x').
If the given character does not occur at least 3 times, return nil.

CASUAL pseudo-code:
#

=end
#-------------------------------------------------------------------------------
def threes_the_charm word
  puts "Enter a letter you would like to search for"
  char = gets.chomp
  char_counter = 0
  to_iterate = char.chars
  to_iterate.each do |l|
    if l == char
      char_counter +=1
      if char_counter == 3 #so this grabs our third x
        to_iterate.find_index(l)
      end
    end
  end
end
#here is the way to answer the problem, because I could not do it on my own
#https://stackoverflow.com/questions/25938430/ruby-how-to-count-the-number-of-times-a-string-appears-in-another-string/25938828#25938828?newreg=92f8dc47a86b4140b18670621d8e4389

#-------------------------------------------------------------------------------
#Next problem
def merges first,second
  first.map do |i|
    if i.even?
      i
    end
  end
end

merges([1, 2, 3], [4, 5, 6])
