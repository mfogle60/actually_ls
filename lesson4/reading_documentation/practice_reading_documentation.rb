require 'date' # this class is part of the standard library

puts Date.new(2001)

# What do we get with the following, class method(Date::civil)?
#   - The years are counted astronomically, so the year before year 0 is -1
#   - we know that the year can be negative or positive (possibly that it be
#     begins with the year -4712)
#   - we know that the month/day of month can be pos or negative,
#     but cannot be zero
#       - the month/day of the month is  negative relative to the end
#         of the year/ month
#   - The last argument of civil should be a Julian day number which denotes the
#     day of calendar reform
p Date.civil # => -4712-01-01
p Date.civil(2016) # => 2016
p Date.civil(2016, 5) # year, month
p Date.civil(2016, 5, 13) # year, month, day
p Date.civil(year=-4712, month=1, mday=1, start=Date::ITALY)

=begin
**Important**
- Know that when there are [] brackets, surrounding arguments that that argument
  is optional!
- Ex: civil([year=-4712[, month=1[, mday=1[, start=Date::ITALY]]]]) → date
- We need to delete the brackets when we actually want to run the code though,
  so it needs to look like this: Date.civil(year=-4712, month=1, mday=1, start=Date::ITALY)
=end

**It is also important to know that**
- The brackets are nested with this method;
  items inside the outermost bracket pairs can only be omitted if all of the
  innermost bracket pairs are omitted as well. Hence, if you omit the month argument,
  you must omit mday and start, but you must supply year. From this signature,
  then, we can see that arguments to civil can be supplied in 5 different ways:

Date.civil                             # everything defaults
Date.civil(2016)                       # month, mday, start use defaults
Date.civil(2016, 5)                    # mday, start use defaults
Date.civil(2016, 5, 13)                # start uses default
Date.civil(1751, 5, 13, Date::ENGLAND) # nothing defaults


**Default arguments in the middle**

def my_method(a, b = 2, c = 3, d)
  p [a, b, c, d] # this returns four elements, so we have to use a default val here # [a, 2, 3, d]
end

# what will this return?
my_method(4, 5, 6) # this only has three arguments, which means we only use 1 of the defaults
# => [4, 5, 3, 6]
**Remember that default values are read left to right so it makes sense
  that parameter `b` is pointing at a new value and not c because it is read first**

**Remember that default values need to be next to each other, grouped together**
def add_values(a = 1, b = 2, c) # this is ok
  a + b + c
end

# this will raise an error
def add_values(a = 1, b, c = 1)
  a + b + c
end

**Mandatory blocks**

# The Array#bsearch method is used to search ordered Arrays more quickly
# than #find and #select can. Assume you have the following code:
a = [1, 4, 8, 11, 15, 19]

a.bsearch do |n|
  n > 8
end
# => 11

# How would you search this Array to find the first element whose value exceeds 8?

# Array#bsearch
#   input: Array.bsearch {|element|...} (takes a block)
#   output: object
# Rules:
# Explicit rules:
#   - By using binary search, finds a value from this array which meets the
#     given condition in O(log n) where n is the size of the array.
#     O(log 6)
#   - There are two searches:
#     1) Find minimum mode (block should either return true or false)
#     2) Find-any mode (block should return a numeric value)
#   - The block should NOT return the aforementioned modes
#   1) Find numeric mode:
#      - Block always returns t or f
#      - There are also no indexes i and j such that:
#        0 <= i < j <= self.size.
#      - The block returns true for self[i] and false for self[j]
#   - In find-minimum mode, method bsearch returns the first element for
#     which the block returns true.
#   2) Find-any mode
#   -

**What does this code print?**
5.step(to: 10, by: 3) { |value| puts value }
5
8
#  => 5

**Parent class**

s = 'abc'
puts s.public_methods.inspect

**Its important to note that public_methods gets all the methods available to
  the class in question, but not only that but the methods inherited from the
  Object class (which inherits other methods from the BasicObject class and the Kernel module).**

**How would you modify this code to print just the public methods that are
  defined or overridden by the String class?
  That is, the list should exclude all members that are only
  defined in Object, BasicObject, and Kernel.**

**The phrase "though perhaps in modified form" from above is there
  because a class can override the members of its superclass.
  In fact, most of the Core and Standard Library API classes do just that.
  For example, String overrides Object#==. What this means for you is that
  you must first look at the documentation for your class before looking at the
  documentation for the superclass.
  Even if you know that the superclass has a particular method,
  you should always check that it isn't being overridden by the subclass.**
    - Important thing here is that we must always check the subclass, `String`
      in this case and make sure that there is no `String#public_methods`
      before we go looking in the super class `Object`

**Find the documentation for the #min method and change the above code to print the two smallest values in the Array.**
a = [5, 9, 3, 11]
puts a.min
# => 3

# Array#min
#   Input: integer parameter (this integer will rep. how many elements we want in array)
#   Output: a new array
# With an argument n and a block, returns a new Array with at most n elements, in ascending order per the block:
a.min(2)
# => [3, 5]

**Important**
  - Know that Ruby uses `Mix-ins` which basically allows a class to use
    methods from other classes, you can find these classes in the `Included Modules`
    section
  - In the ex above we can find min in the Enumerable class
  - Mix-in functionality allows sharing common methods across multiple classes or modules.
    Ruby comes with the Enumerable mix-in module
    which provides many enumeration methods based on the each method and
    Comparable allows comparison of objects based on the <=> comparison method
  - Note that there are many similarities between modules and classes.
    Besides the ability to mix-in a module, the description of modules below also applies to classes.
