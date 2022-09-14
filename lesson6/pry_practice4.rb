require 'pry'

def double_num(num)
  num * 2
end

# what will happen when we put binding.pry as our last line in our code?
arr = [1, 2, 3].map do |num|
  double_num(num)
  binding.pry
end

p arr
# with binding.pry as our last line in arr we get 'nil' returned to us, the
# binding.pry does not allow map to work correctly.
