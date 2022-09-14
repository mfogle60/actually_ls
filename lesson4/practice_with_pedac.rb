# problem: Given a string, write a method `change_me` which returns the same string but w/ all the words in it that are palindromes uppercased.

# Test cases:
# change_me("We will meet at noon") == "We will meet at NOON"
# change_me("No palindromes here") == "No palindromes here"
# change_me("") == ""
# change_me("I LOVE my mom and dad equally") == "I LOVE my MOM and DAD equally"

# **P: Understand the Problem **
# Restate the problem
#   - Be given a string
#   - Return the very same string
#     - for the exception of the WORD(s) that is/are a palindrome. Palindromes need to be uppercase.
# -------------
# input: String
# output: String (with palindromes uppercased)

# Rules:

# Explicit:
#   - Palindromes need to be turned to all caps
#   - Same string needs to be returned
#   - If no palindromes in string return 'No palindromes here'
#   - If string is empty, return empty string

# Implicit:
#   - WORDS not substrings must be capitalized
#   - We must assume that the word must be all lowercase in order for it to be a palindrome. For ex, `noon` is a palindrome, `Noon` isn't
#   - We must assume that we must return a new object, not the same string input we are given as an arg.
#     - We want to do this bc we just want to leave the original string object the same way as it was before we passed it as an arg
#   - What if the word is a palindrome, but it has a comma next to it?

# ========================
# **Examples/Test cases**

# Examples:
# Input: 'The sagas of war end now' -> 'The SAGAS of war end now'
# Input: 'The Sagas of war end at noon' -> 'The Sagas of war end at NOON'
# Input: 'The saga of war ends now' -> 'No palindromes here'
# Input: '' -> ''

# Test cases
# change_me("We will meet at noon") == "We will meet at NOON"
# change_me("No palindromes here") == "No palindromes here"
# change_me("") == ""
# change_me("I LOVE my mom and dad equally") == "I LOVE my MOM and DAD equally"

# REMEMBER to ask interviewer for clarification wherever you need it

# ===========================================

# **Data Structure**
# Turn our logic into a data structure
# What kind of data structure do the requirements of this problem require us to use?

# Requirements that are imperative for data structure to have:
#   - Order does matter
#   - We need to be able to access each word in order to see if it is a palindrome


# ===========================================

# **Algorithm**
# Remember to think very high-level and abstract
# 1. Make sure only words are read, not punctuation marks
# 2. Make sure word is a palindrome
#    - if it is then capitalize it
#    - if not then go to next word
# 3. Repeat step 1 and 2 until we reach the end of the string
# 4. Return string

# Mini algorithm for step 1:
# 1. Separate word from punctuation mark

# input: 'This war, the war of sagas, is incredibly bad.' -> 'This war, the war of SAGAS, is incredibly bad.'
# input: 'My rotator! It hurts so much, I have never felt this level of pain.' -> 'My ROTATOR! It hurts so much, I have never felt this LEVEL of pain.'

# ==========================================

# **Algorithm**
# Remember to think very high-level and abstract
# 1.Check word and see if it has a punctuation mark
# 2. Make sure word is a palindrome


# **Algorithm** (Remember to think very high-level and abstract)

# 1.Check word and see if it has a punctuation mark
#     - Look at mini algorithm for further explanation
# 2. Check if word is a palindrome
#    - if it is then capitalize it
# 3. Repeat step 1 and 2 until we reach the end of the string
# 4. Return string


# Example:
# 'Hi, anna!' -> 'Hi anna'


# informal pseudo


# Mini algorithm for step 1:
# 1. Go word by word
#      - separate the word from its punctuation mark
#      - is that word a palindrome? If so, then capitalize
#      - if it isn't then go to next word


# checks if it has punctuation marks or not
def palindrome_checker(str)
  if has_punctuation_marks?(str) # if it has punctuation marks
    array = %w(, . ? !)
    p get_rid_of_punctuations!(array, str) #  WHERE I LEFT OFF: this requires us to add in an array here!!!
  else
    p capitalize_palindromes(str) # no punctuation marks
  end
end

def has_punctuation_marks?(str) # gonna check this
  count = 0
  arr = %w(? ! . ,)
  loop do
    if str.include?(arr[count])
      return true
    elsif !(str.include?(arr[count])) && count == arr.size - 1
      return false
    end
    count += 1
  end
end

def get_rid_of_punctuations!(array, str)
  new_string = str
  array.each do |mark|
    if str.include?(mark)
      new_string = str.split(mark)
      mark.upcase!
    end
    array.delete(mark)
    new_string = new_string.join(" ")
  end
  capitalize_palindromes(str)
end

def capitalize_palindromes(str)
  str = str.split()
  str.each do |word|
    if word == word.reverse
      word.upcase!
    end
  end
  return str.join(" ")
end


str = "Hi anna where is bob he is always late for the sagas."
palindrome_checker(str)

=begin
str = "Hi anna where is bob he is always late for the sagas."
str = str.split

3.0.0 :016 > str.each do |w|
3.0.0 :017 >   if w.include?('.')
3.0.0 :018 >     w.split('.')
3.0.0 :019 >     w.upcase!
3.0.0 :020 >   end
3.0.0 :021 > end
 => ["Hi", "anna", "where", "is", "bob", "he", "is", "always", "late", "for", "the", "SAGAS."]


=begin
 def get_rid_of_punctuations!(arr, str)
   new_string = str
   loop do
     arr.each do |mark|
       if str.include?(mark)
         new_string = new_string.split(mark)
         new_string = new_string.join
         arr.delete(mark) # deletes ','
       end
     end
     break if check_p_marks(new_string)
   end
   capitalize_palindromes(str)
 end


 def check_p_marks(str)
   count = 0
   arr = %w(? ! . ,)
   loop do
     if str.include?(arr[count])
       return false
     elsif !(str.include?(arr[count])) && count == arr.size - 1
       return true
     end
     count += 1
   end
 end

=end
