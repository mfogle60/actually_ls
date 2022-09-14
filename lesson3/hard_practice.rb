# the most important thing is to accept a string
# that string will get split up into an array
# Make sure that we handle situations where arrays are more than 4 characters
# less than 4 characters, and obviously 4 characters


def dot_separated_ip_address(input_string)
  dot_separated_words = input_string.split(".")
  while dot_separated_words.size > 4 do
    word = dot_separated_words.pop
  end
  if dot_separated_words.size < 4
    puts "Your ip address is not long enough."
    return
  end
  puts is_an_ip_number?(dot_separated_words)
end

# this takes an array of string numbers
def is_an_ip_number(string)
  arr = []
  string.each do |n| # turns array from array of string elem to array of int elem
    arr << n.to_i
  end
  if arr.min < 0 || arr.max > 255
    return "Sorry, your ip address has an innapropriate value in it."
  elsif arr.min > 0 && arr.max < 255
    arr = arr.join('.')
    return "Hooray! Here is your ip address: #{arr}"
  end
end


# this other method simply returns a boolean

def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split('.') # splits the ip address by dot
  return false unless dot_separated_words.size == 4

  while dot_separated_words.size > 0
    word = dot_separated_words.pop # now the element popped off will be compared
    return false unless is_an_ip_number?(word) # return false unless true
  end

  true # this will return true when we have looked at every single element
end

def is_an_ip_number?(w)
  w = w.to_i # turns to an int
  (w > 0 && w < 255) ? true : false
end
