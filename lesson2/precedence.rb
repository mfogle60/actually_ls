# precedence determines the meaning of an expression
# in an expression, operators with higher precedence are implemented before
# those with a lower precedence
# parentheses override the default evaluation order

# Most important rule: If you're using two or more different operators
# in an expression use parentheses to explicitly define the meaning.

# An operator that has higher precedence than another is said to bind more tightly
# to its operands
# ------------------------------------------------------------------------------
# unary operators take one operand
# ternary operators take three operands
# ------------------------------------------------------------------------------
# precedence can make our operators do interesting things:
# in all of these cases we get a zero ZeroDivisionError
3 ? 1 / 0 : 1 + 2  # raises error ZeroDivisionError
5 && 1 / 0         # raises error ZeroDivisionError
nil || 1 / 0       # raises error ZeroDivisionError

# but.. what if we used our operators to avoid that ZeroDivisionError ?
# for the first one we can do the following..
nil ? 1 / 0 : 1 + 2 # three gets output bc nil is equivalent to false

# for the second one.. we can just put nil as the first operand to avoid it
nil && 1 / 0

# for the last one.. we can just put a 5 bc it is truthy
5 || 1 / 0
# ------------------------------------------------------------------------------

# right-to-left evaluation occurs when there are multiple assignments
a = b = c = 3
# this is not good practice so don't do it
# but in this case c is 3, b is equal to c, and a is equal to b, a is equal to c
# c is also equal to a
# bottom line is that they're all equal to 3

# ------------------------------------------------------------------------------
# one of the problems that gave me the most issues was this example:
# the operator of precedence of p and its impact on its arguments
array = Array(1..3)
p array.map do |num| # this will output Enumerator:[1,2,3]:map
  num + 1
end

p array.map {|num| num + 1} # this will output [2,3,4] and return [2,3,4]

# so blocks have the lowest precedence possible, but {} has a slightly
# higher precedence than do..end
# The operator precedence in these cases determines which method call the
# block gets passed to
# this makes sense, as expressions are determined by their operator precedence

# so in the first example we read the expression L to R, so the first thing
# that gets printed is p method doing its thing on array.map, this itself
# returns an Enumerator, then we get what is returned which is the object's
# array, [1,2,3] and then we get the method that was NOT called on it, :map
# the final result? Enumerator: [1,2,3]:map
=begin
This is super IMPORTANT
Thus, array.map gets executed first,then the return value and the block get
passed to p as separate arguments.
=end
# the block is ignored in this case !

# This code is equivalent to the code above, just that this time we used
# parentheses

array = [1, 2, 3]

p(array.map) do |num|
  num + 1                           #  <Enumerator: [1, 2, 3]:map>
end                                 #  => <Enumerator: [1, 2, 3]:map>

p(array.map { |num| num + 1 })      # [2, 3, 4]
                                    # => [2, 3, 4]
# ------------------------------------------------------------------------------
# .tap allows us to go into a block and do whatever we want
# ------------------------------------------------------------------------------
# remember to always use parentheses with operators! they will help you
# override operator precedence
