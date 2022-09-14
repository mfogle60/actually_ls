# How would you order this array of hashes
# based on the year of publication of each book, from the earliest to the latest?

books = [
  {title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez', published: '1967'},
  {title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published: '1925'},
  {title: 'War and Peace', author: 'Leo Tolstoy', published: '1869'},
  {title: 'Ulysses', author: 'James Joyce', published: '1922'}
]

# P:
# we want to order our hashes, based on the year of pub from earliest to latest
# Output: ordered hashes within our array

# Data structure
# i need hashes organized in our array

# Algorithm
# 1) We receive an array
# 2) Iterate thru array, every index is a hash
# 3) We want to re-order those hashes, while maintaining their integrity
# 3) Within that hash, we have what we want to sort, the pub. yr
# 4) We must make that yr into an integer
# 5) Compare the years, by being able to compare every single year at once



# Code
 books.sort_by do |hash| # our local var are the individual hashes
   hash[:published].to_i # within the hash we want to sort by the year!
 end

# Question 3
# For each of these collection objects demonstrate how you would reference the letter 'g'.

arr1 = ['a', 'b', ['c', ['d', 'e', 'f', 'g']]] # 2,
# arr1[2][1][3]

arr2 = [{first: ['a', 'b', 'c'], second: ['d', 'e', 'f']}, {third: ['g', 'h', 'i']}]
# arr2[1][:third][0]

arr3 = [['abc'], ['def'], {third: ['ghi']}]
# arr3[2][:third][0][0]

hsh1 = {'a' => ['d', 'e'], 'b' => ['f', 'g'], 'c' => ['h', 'i']}
# hsh1['b'][1]

hsh2 = {first: {'d' => 3}, second: {'e' => 2, 'f' => 1}, third: {'g' => 0}}
# hsh2[:third].keys

# Question 4:
# For each of these collection objects where the value 3 occurs, demonstrate how you would change this to 4.

arr1 = [1, [2, 3], 4]
# arr1[1][1] = 4

arr2 = [{a: 1}, {b: 2, c: [7, 6, 5], d: 4}, 3]
# arr2[2] = 4

hsh1 = {first: [1, 2, [3]]}
# hsh1[:first][2][0] = 4

hsh2 = {['a'] => {a: ['1', :two, 3], b: 4}, 'b' => 5}
# hsh2[['a']][:a][2] = 4

# Practice Problem 5
# Figure out the total age of the male family members
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

male_ages = munsters["Herman"]["age"] + munsters["Grandpa"]["age"] + munsters["Eddie"]["age"]

m_ages = 0
munsters.map do |k, _|
  if k == "Grandpa" || k == "Eddie" || k == "Herman"
    m_ages += munsters[k]['age'] # i tried doing k['age'] and it wouldnt let me
  end
end

# Practice problem 6
# One of the most frequently used real-world string properties is that of "string substitution",
# where we take a hard-coded string and modify it with various parameters from our program.

# Given this previously seen family hash, print out the name, age and gender of each family member:
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

# (Name) is a (age)-year-old (male or female).

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

# (Name) is a (age)-year-old (male or female).

males = ['Herman', 'Eddie', 'Grandpa']

munsters.each_key do |key|
  if males.include?(key)
    puts "#{key} is a #{munsters[key]['age']}-year-old male."
  else
    puts "#{key} is a #{munsters[key]['age']}-year-old female."
  end
end

# Determine why this isnt working as I would like it to
=begin
munsters.each_key do |key|
  case key # this means that all of our keys will be true
  when 'Herman' || 'Eddie' || 'Grandpa'
    puts "#{key} is a #{munsters[key]['age']}-year-old male."
  else
    puts "#{key} is a #{munsters[key]['age']}-year-old female."
  end
end
=end

# Practice problem 7
# Given this code, what would be the final values of a and b? Try to work this out without running the code.

a = 2
b = [5, 8]
arr = [a, b] # arr = [2, [5, 8]]

arr[0] += 2 # arr = [4, [5, 8]]
arr[1][0] -= a # arr = [2, [3, 8]]

a == 4 # wrong
b == [3, 8]

# Question 8
# Using the each method, write some code to output all of the vowels from the strings.
hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

# Problem:
- We need to use the .each method that will output ALL the vowels from the strings
- We have:
  - A hash with 4 key-value pairs
    - Our keys are symbols
    - Our values are arrays with string elements
# Example:
- 'the' -> 'e'
- 'quick' -> 'u', 'i'
- 'brown' -> 'o'
- 'fox' -> 'o'
...

# Data Structure
- We actually need to iterate over the arrays to output our strings

# Algorithm
1. Grab first key
  - grab first str
  - search that str for vowels
    - if it has a vowel then output it to screen
    - else skip it
2. Repeat step one until were done w/ all of our keys

# Code:

vowels = ['a', 'e', 'i', 'o', 'u']

hsh.each do |k, _|
  hsh[k].each do |str|
    str.chars.each do |vowel|
      puts vowel if vowels.include?(vowel)
    end
  end
end

# Question 9
# Given this data structure, return a new array of the same structure but with
# the sub arrays being ordered (alphabetically or numerically as appropriate) in descending order.

arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]

# Problem
- I need to rearrange the array, I cannot mess with the structures
  - I just need to organize the respective arrays, either numerically or alphabetically

# Example:
arr = [['a', 'b', 'c'], [1, 2, 3], ['black', 'blue', 'green']]

# Data Stucture
- need to respect the structures, so everything will still be an array

# Algorithm:
- I have an array with 3 sub arrays
1. Grab first sub array
   - Sort it
2. Go to next element in array then do the same
3. Continue doing this until we get through array

# Code:

arr.map! do |item|
  item.sort
end

# Question 10

# Given the following data structure and without modifying the original array,
# use the map method to return a new array identical in structure to the original
# but where the value of each integer is incremented by 1.

[{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]

# Understand the problem
- Do not alter the structures
- We simply want to increment every value by 1
- We do NOT want a new object, just return the new object

# Example:
[{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}] # Before
[{a: 2}, {b: 3, c: 4}, {d: 5, e: 6, f: 7}]# after

# Data structure
- We have an array with 3 indexes, each index has a hash element
- We need to return a hash element tho

# CODE
# works
[{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}].map do |hash|
  hash.each do |key, val|
    hash[key]= val + 1 # hash is repping each hash object
  end
end

# does NOT work
=begin
[{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}].map do |hash|
  hash.map do |key, val|
    hash[key][val] += 1 # hash is repping each hash object
  end
end
=end

# Question 11

# Given the following data structure use a combination of methods, including
# either the select or reject method, to return a new array identical in
# structure to the original but containing only the integers that are multiples of 3.

arr = [[2], [3, 5, 7], [9], [11, 13, 15]]

# Algorithm
- We have an array filled with sub array elements
1. Grab first item in array
   - Its also an array, so we have to grab the item in the subarray too
   - if its a multiple of 3 then we can keep it
   - else do not include it in the array
2. Repeat step 1 until we reach end of array

arr.map do |subarr|
  subarray.select do |num|
    if num % 3 == 0
      num
    end
  end
end

# Question 12
# Given the following data structure, and without using the Array#to_h method,
# write some code that will return a hash where the key is the first item in
# each sub array and the value is the second item.

arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]
# expected return value: {:a=>1, "b"=>"two", "sea"=>{:c=>3}, {:a=>1, :b=>2, :c=>3, :d=>4}=>"D"}

# Algorithm
- We are given an array
- That arrays elements are all sub arrays
- We need to turn every array into a hash essentially
  - What is on the left will be the key, what is on the right will be the val
    - they will be their own hash
1. We need to grab the first item in our array (this will be a sub array)
2. Turn that subarray into a hash, the item on the left will be a key
3. Repeat steps 1 thru 2

hsh = {}
arr.each_with_object(hsh) do |item, obj|
  obj[item.first] = item.last
end
# => {:a=>1, "b"=>"two", "sea"=>{:c=>3}, {:a=>1, :b=>2, :c=>3, :d=>4}=>"D"}

=begin DOESNT WORK
arr.map do |subarr| # outer array
  # inner array
  subarr.each do |element|
    subarr = element => element
  end
end
=end

# Question 13:

# Given the following data structure, return a new array containing the
# same sub-arrays as the original but ordered logically by only taking into
# consideration the odd numbers they contain.

arr = [[1, 6, 9], [6, 1, 7], [1, 8, 3], [1, 5, 9]]

# The sorted array should look like this:
[[1, 8, 3], [1, 5, 9], [6, 1, 7], [1, 6, 9]]


# Understand the problem

# I'm given an array that is filled with sub arrays
# I just need to sort the sub arrays entirely
#   - I need to rearrange the arrays tho depending on the sequence of odd numbers
# We are exclusively worried about the odd numbers

# Algorithm:
1. Create an array and name it: `odds_only`
2. We want to compare every sub array with the other


# Had A TON of issues with this problem

# Question 14:

# Given this data structure write some code to return an array containing
# the colors of the fruits and the sizes of the vegetables.
# The sizes should be uppercase and the colors should be capitalized.

hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}

# The return array should look like this:
[["Red", "Green"], "MEDIUM", ["Red", "Green"], ["Orange"], "LARGE"]


# Algorithm:
1. I have a hash, that has key-strings, and it has values that are hashes
   within those hashes are more key-value pairs
# It makes most sense to put :colors and :size into one array

hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}

# an array within a hash
arr = []

hsh.each do |k, _|
  arr << hsh[k][:colors].map {|item| item.capitalize}
  arr << hsh[k][:size].upcase
end

# Question 15:

# Given this data structure write some code to return an array which
# contains only the hashes where all the integers are even.

arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]

# Understand the Problem
#   - Need to return an array that will contain only the hashes where all the integers are even
# Input: an array, output: an array

#Example
arr = [{e: [8], f: [6, 10]}]

# Algorithm:
1) check each index, that index will be a hash, so access its value
   which will be an array
2) If that value has an odd integer, then skip it
3) If the value has only even integers then we want it in our new array
4) Need to iterate thru every item in value array to accomplish steps 2 and 3

# There are two indexes within an array
# I need to be able to get a hash from an array
#   - While depending on the contents of the values of the hashes

# When we iterate thru array, we get two indexes
first -> {a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}
second -> {e: [8], f: [6, 10]}

# When we iterate thru first index, at index 0, we get:
[0][0] -> {a: [1, 2, 3]}
[0][1] -> {b: [2, 4, 6], c: [3, 6], d: [4]}

# We're looking to select the SUB HASHES that have only even integers
arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]

arr.map do |hash| # if we use .select here, the whole array gets chosen
  hash.select do |k, v|
    next hash if hash[k].all? { |e| e.even? }
  end
end
 => [{}, {:b=>[2, 4, 6], :d=>[4]}, {:e=>[8], :f=>[6, 10]}]

# this works
 arr.select do |hsh|
   hsh.all? do |_, value|
     value.all? do |num|
       num.even?
     end
   end
 end






arr.map do |subhash| # focusing on each index in our array
  subhash.select do |k, v| # Now i am seeing which sub hash I want, our k points to our array, we need to iterate over our array
    subhash[k].select do |integer| # Now I am iterating thru our hash key's value: our array
      subhash[k] if integer % 2 == 0 # if each int in array is even select that key-val
    end
  end
end





































# more practice
practice = {a: {tx: 'Texas'}, ['cities in tx'] => ['Abilene', 'Lubbock', 'El Paso']}
