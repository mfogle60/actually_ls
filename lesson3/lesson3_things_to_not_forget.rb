# remember that you can actually return more than one item
# in a method, ex:

# How can we change this code to make the result easier to predict
# and easier for the next programmer to maintain? That is, the resulting method should
# not mutate either argument,
# but my_string should be set to 'pumpkinsrutabaga'
# and my_array should be set to ['pumpkins', 'rutabaga']

# Solution:

def not_so_tricky_method(a_string_param, an_array_param)
  a_string_param += 'rutabaga'
  an_array_param += ['rutabaga']
  return a_string_param, an_array_param # see, here we return more than one var
end

my_string = 'pumpkins'
my_array = ['pumpkins']
# now we assign new variables to the what not_so_tricky_method returns
first_var, second_var = not_so_tricky_method(my_string, my_array)

puts "My variable \'first_var\', now has a value of: #{first_var}"
puts "My variable \'second_var\' now has a value of: #{second_var}"
puts "But my initial variable of \'my_string\' still has the value: #{my_string}"
puts "But my initial variable of \'my_array\' still has the value: #{my_array}"

# ==============================================================================
# make this method simpler

def color_valid(color)
  if color == "blue" || color == "green"
    true
  else
    false
  end
end

# Ruby automatically evaluate statements, so this is simpler
def color_valid(color)
  color == 'blue' || color == 'green'
end
# => true or false

# ==============================================================================

# what does the following return?

if false
  greeting = 'Hi'
end

greeting # => nil

# so in conditionals, even if a branch is not executed the variable will still
# be initialized, but obviously it will not be assigned the value 'Hi'
# it'll simply be assigned nil

# ==============================================================================
# If we want to reference a new object, with the value from another object then
# We need to use the .clone method, it is available to all classes

random = {greet: 'hi'}

copy = random.clone

copy[:meow] = 'kitty'
# => {greet: 'hi', meow: 'kitty'}

random
# => {greet: 'hi'}
