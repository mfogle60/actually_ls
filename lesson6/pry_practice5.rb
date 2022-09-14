require 'pry'

a = 0
b = 0

loop do
  a += 1
  binding.pry
  b += 1
  break if b >= 3
end

# What do you think binding.pry will do ??
# Well, since we have binding.pry after the first iteration, a == 1,
# b == 0, if we keep pressing 'enter' then nothing will change and we will
# get the same results infinitely..

# But if we enter ctr + d (or the keyword exit) we
# will break out from binding and we will continue looping, so a will continue being incremented
# and so will b. Until the loop ends
