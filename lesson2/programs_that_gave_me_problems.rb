#try to pass in an array with only integers and create a method
#that returns an array with every other value
def evens parameter
  empty = [] # set to empty array
  index = 0
  for p in parameter
    if index.even?
      empty << p
    else
      next p
    end
      index +=1
  end
  return empty
end

numbers = [1,2,3,4,5]

#-------------------------------------------------------------------------------
#Why i think this program gave me issues: its the next in the else clause that
#kicked me out of the for loop
#-------------------------------------------------------------------------------

#-------------------------------------------------------------------------------
#this way works now!
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
