# What happens if we try to initialize a Hash that contains duplicate keys?

hsh = {a: 100, b: 200, c: 300, a: 400}
# keys have to be unique


# ===============================
# Question 3: Identify all of the code implementations that correctly meet the following set of requirements.

# Given an array of integers, for each integer output all integers
# from 1 to that integer; e.g. if the integer was 5, you would output 1, 2, 3, 4, 5.


# B)
numbers = [7, 3, 5, 2, 1, 8, 4]
counter = 0

loop do
  number = numbers[counter] # setting number to the first index
  counter = 0 # reset the counter to 0

  loop do
    counter += 1 # set counter to equal 1
    puts counter # counter == 1

    break if counter >= number
  end

  counter += 1
  break if counter >= numbers.size
end

# C)
numbers = [7, 3, 5, 2, 1, 8, 4]

for number in numbers #gives us access to every index
  counter = 0 # start at 0

  loop do
    counter += 1 # increase by 1
    puts counter # 1, 2, 3

    break if counter >= number
  end
end

# D)
numbers = [7, 3, 5, 2, 1, 8, 4]

numbers.each do |number|
  counter = 0 # this resets our counter var after each iteration, also needs to be zero bc times acts as if this is the first index
  number.times do # will loop 7 times,
    counter += 1
    puts counter
  end
end

# =================================================
# Question 10
# Identify all the code samples which are examples of selection.

# B)
hsh = {a: 'apple', b: 'pear', c: 'orange', d: 'kiwi', e: 'banana'}
counter = 0

new_hsh = {}

for letter, fruit in hsh
  new_hsh[letter] = fruit if fruit.size > 4
end
# => {a: 'apple', b: 'pear', c: 'orange', d: 'kiwi', e: 'banana'}

p new_hsh
# => {a: 'apple', c: 'orange', e: 'banana'}

# D) Not an example of selection
num_arr = [2, 4, 7, 8, 11, 15]
counter = 0

until counter == num_arr.size
  puts num_arr[counter] + 1

  counter += 1
end

=begin
# Output:
3
5
8
9
12
16
=end

# ==================================
# Question 11
# Identify all the code samples which are not examples of transformation.
# ==================================

# Question 20)

# an array, with hash elements
mailing_campaign_leads = [
  {name: 'Emma Lopez', email: 'emma.lopez@some_mail.com', days_since_login: 423, mailing_list: true},
  {name: 'mike richards', email: 'michael.richards@some_mail.com', days_since_login: 23, mailing_list: false},
  {name: 'JANE WILLIAMS', email: 'jane_w95@my_mail.com', days_since_login: 16, mailing_list: true},
  {name: 'Ash Patel', email: 'ash_patel@my_mail.com', days_since_login: 22, mailing_list: true}
]


# Legacy code

counter = 0

loop do # this loop ends once we iterate thru all of the hash items in our array, it also helps us access the `name` key to start off with, then we split it up
  break if counter == mailing_campaign_leads.size # its got a length of 4
  full_name = mailing_campaign_leads[counter][:name] # 'Emma Lopez'
  names = full_name.split # ['Emma', 'Lopez']

  names_counter = 0
  loop do # the point of this loop is to loop over the name and to capitalize both first and last name
    break if names_counter == names.size # its == 2
    name = names[names_counter] # name = 'Emma', 2nd it: 'Lopez'
    names[names_counter] = name.capitalize # => 'Emma', 2nd it: 'Lopez'

    names_counter += 1 # increase by 1
  end

  capitalized_full_name = names.join(' ') # => 'Emma Lopez'
  mailing_campaign_leads[counter][:name] = capitalized_full_name # this puts the updated capitalized name in the hash once again

  counter += 1
end
# so in the above we are just capitalizing names and adding them back into the hash

usable_leads = []
counter = 0

loop do
  break if counter == mailing_campaign_leads.size # ends the loop once we get to end of it
  last_login = mailing_campaign_leads[counter][:days_since_login] # created a variable to put the number since user's last login
  subscribed_to_list = mailing_campaign_leads[counter][:mailing_list] # created a var to put whether the user is subscribed or not

  if last_login < 60 && subscribed_to_list # conditional based on if the user has logged in in less than 60 days AND that they are subscribed to the mailing list.
    usable_leads << mailing_campaign_leads[counter] # if conditional true, then add the hash of the person to the usable_leads arr
  end

  counter += 1 # increase counter by 1
end


# C)
mailing_campaign_leads.each do |lead|
  names = lead[:name].split
  lead[:name] = names.map { |name| name.capitalize }.join(' ')
end

# Using reject on a array, it returns an array
usable_leads = mailing_campaign_leads.reject do |lead|
  last_login = lead[:days_since_login] # 1st iteration: 423
  subscribed_to_list = lead[:mailing_list] # true
  last_login > 59 && !subscribed_to_list
end

# Returns a new Array whose elements are all those from self for which the block returns false or nil:
# 1st iteration: 423, true
#   - last_login > 59 && !true
#   - returns true and false

# 2nd iteration: 23, false
#   - last_login > 59 && !false
#   - returns false and true

# 3rd iteration: 16, true
#   - last_login > 59 && !true
#   - returns false and  false

# 4th iteration: 22, true
#   - last_login > 22 && !true
#   - returns false and false

# I think that usable_leads should return the following:
# => [{name: 'JANE WILLIAMS', email: 'jane_w95@my_mail.com', days_since_login: 16, mailing_list: true}, {name: 'Ash Patel', email: 'ash_patel@my_mail.com', days_since_login: 22, mailing_list: true}]

# Why C is wrong:

# When evaluating our usable_leads, we want to check that the customer's
# last login was less than 60 days ago and also that they are subscribed to our mailing list.
# Because this solution uses reject rather than select it is only eliminating leads where neither of those things
# are true rather than just one of them.
# This could be fixed by using || instead of && in the conditional.

# reject is like .select in that we cannot change the composition of our object

# =================================
**questions whose answer choices gave me problems**
# Question 2)

# Given an array of strings representing integers, iterate through all of the items in the array. If the integer value
# of the string is odd add it to a new array of odd integer strings.
# Once iteration is complete the new array should contain all of the odd integer strings from the original array.

numbers = ['2', '3', '5', '7', '8', '11', '13', '15', '18']
odd_numbers = []
counter = 0

loop do
  number = numbers[counter].to_i

  odd_numbers << numbers[counter] unless number.even? # so we add in the item unless the number is even

  counter += 1
  break if counter == numbers.size
end

# Question 3
# Given an array of integers, for each integer output all integers from 1 to that integer; e.g. if the integer was 5, you would output 1, 2, 3, 4, 5.

# A)
numbers = [7, 3, 5, 2, 1, 8, 4]
counter = numbers.size # counter = 7

loop do
  number = numbers[-counter] # we're using [] method to call on  7 for the first iteration
  for num in 1..number
    puts num # 1, 2, 3, 5, 6,7
  end

  break if counter == 1
  counter -=1
end

# B) Not a correct answer
numbers = [7, 3, 5, 2, 1, 8, 4]
counter = 0

loop do
  number = numbers[counter] # does counter stay as 0 or 1? rn its 7
  counter = 0

  loop do
    counter += 1 # 1, 2, 3, 4,5, 6, 7,
    puts counter # 1, 2, 3, 4,5, 6, 7

    break if counter >= number
  end

  counter += 1 # counter == 8
  break if counter >= numbers.size # break out
end

# D)
numbers = [7, 3, 5, 2, 1, 8, 4]

numbers.each do |number|
  counter = 0
  number.times do # 7
    counter += 1 # 7 times we are increasing counter
    puts counter # 1, 2, 3, 4, 5,6, 7
  end
end

# ===========================================
# Question 10
# Choose all the examples of selection

# B)
hsh = {a: 'apple', b: 'pear', c: 'orange', d: 'kiwi', e: 'banana'}
counter = 0

new_hsh = {}

for letter, fruit in hsh # letter, fruit (represents the key and the value)
  new_hsh[letter] = fruit if fruit.size > 4
end

# C)
def some_method(words) # words is an array
  arr = []
  counter = 0

  loop do
    word = words[counter]
    arr << word if word.size < 4 # add into arr, any word that is less than 4

    counter += 1
    break if counter == words.size
  end

  arr
end

poem = %w(April is the cruelest month)
some_method(poem)

# ================================

# 11) Identify all the code samples which are not examples of transformation.

# A) This is an example of transformation
def star_method(stars) # assume that stars is an array
  arr = []
  stars.each do |star| # every item from our array
    arr.push(star.upcase) # is getting added to the new array but uppercase
  end
  arr
end

stars_1 = ['Sirius', 'Rigel', 'Vega', 'Polaris', 'Altair']
stars_2 = star_method(stars_1)

# B) This is an example of selection
def star_method(stars)
  arr = []
  counter = 0

  until counter == stars.size
    star = stars[counter] # We are setting first item of the arr to the var: `star`
    arr << star if star.size > 4

    counter += 1
  end
  arr
end

stars_1 = ['Sirius', 'Rigel', 'Vega', 'Polaris', 'Altair']
stars_2 = star_method(stars_1)

# C)
def star_method(stars)
  for star in stars
    star.downcase # The result value of a for loop is the value iterated over unless break is used. So it returns our arr like normal
  end
end

stars_1 = ['Sirius', 'Rigel', 'Vega', 'Polaris', 'Altair']
stars_2 = star_method(stars_1)

# D)
def star_method(stars)
  arr = []
  counter = 0

  until counter == stars.size do
    arr << stars[counter][0, 3] # remember this stops at 3

    counter += 1
  end
  arr
end

stars_1 = ['Sirius', 'Rigel', 'Vega', 'Polaris', 'Altair']
stars_2 = star_method(stars_1)

# =================================

# Question 12)
# .select will give us the empty array
# and because nil keeps getting returned to `.select` then nothing can be chosen
# and if nothing gets chosen then the array is going to be empty.
['a', 'b', 'c'].some_method do |item|
  puts item # returns nil
end
# => []

# =================================

# Question 13)
# Not .each/.map/.select return an empty array in this case
[1, 2, 3, 4, 5].some_method do |num|
  num + 1 # we are adding every item in the array by one
end
# => []

# ==================================

# Question 15)
# Within the code below, identify the method represented by some_method:
{a: 1, b: 2, c: 3, d: 4, e: 5}.some_method do |_, num| # we are just focusing on the value
  plus_one = num + 1
  puts "#{num} plus 1 is #{plus_one}"
end
# => {:a => 1, :b => 2, :c => 3, :d => 4, :e => 5}

# =================================

# Question 16)
# Carefully examine the following code example.
pets = ['cat', 'parrot', 'dog', 'fish']
pets.map do |pet|
  pet.size == 3
end

# =================================
# Question 17)
# Carefully examine the following code example.
flavors = ['chocolate', 'strawberry', 'mint', 'vanilla']
flavors.reject { |flavor| puts flavor } # this returns a new array with all the original items of the flavor array

# =================================
# Question 18)
# Identify all of the code implementations that correctly meet the following set of requirements.
# Given an array numbers which contains both odd and even integers; create two new arrays,
# odd_numbers which contains the odd integers from the original array and even_numbers which contains the even integers.

# A)
numbers = [1, 2, 4, 5, 7, 8, 10, 13, 14]

odd_numbers = numbers.select do |number|
                number.odd?
              end

even_numbers = numbers.select do |number|
                number.even?
              end

# B)
numbers = [1, 2, 4, 5, 7, 8, 10, 13, 14]
odd_numbers = []
even_numbers = []

numbers.each do |number|
  if number.even?
    even_numbers << number
  elsif number.odd?
    odd_numbers << number
  end
end

# C)
numbers = [1, 2, 4, 5, 7, 8, 10, 13, 14]
odd_numbers = []
even_numbers = []

for number in numbers
  next if number.odd? # skips if odd
  even_numbers << number # adds all even numbers
end

for number in numbers
  next unless number.odd? # skips evens
  odd_numbers << number # puts in odd_numbers
end

# D)
numbers = [1, 2, 4, 5, 7, 8, 10, 13, 14]
odd_numbers, even_numbers = numbers.partition do |number|
                              number.even?
                            end
# the first array will be all even numbers, and the second array
# will be all odd numbers

# ===============================
# Question 19) Identify all of the code implementations that correctly meet the following set of requirements

# Given the following hash which contains keys representing countries
# and values representing the capital cities of those countries,
# return a new hash containing all of the key-value pairs where the country begins with the letter 'B'.

countries_and_capitals = {
  'France' => 'Paris',
  'Belgium' => 'Brussels',
  'Morocco' => 'Rabat',
  'Barbados' => 'Bridgetown',
  'Peru' => 'Lima',
  'Bolivia' => 'La Paz',
  'Brazil' => 'Brasilia'
}

# A)
countries_and_capitals.select { |_, country| country[0] == 'B' }
# select returns a new hash because we were given the key and value
# =>  {"Belgium"=>"Brussels", "Barbados"=>"Bridgetown", "Brazil"=>"Brasilia"}

# B)
countries_and_capitals.each_with_object({}) do |(k, v), obj|
  obj[k] = v if k.chr == 'B'
end

# C)
def select_countries(hsh)
  sub_set = {}
  hsh.each_key do |country| # we are grabbing every key of our hash
    if country[0] == 'B' # if the key begins with b
      sub_set[country] = hsh[country]
    end
  end
  sub_set
end

select_countries(countries_and_capitals)

# D)
def begins_with_b(string) # can return true or false
  string[0] == 'B'
end

countries_and_capitals.find_all do |country, capital|
  begins_with_b(country) # gonna get our key passed into the arg
end
# find_all returns a new array or hash, if the block returns a true value
# find_all is an alias of .select
