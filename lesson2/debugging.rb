# when you see a large stack trace, don't despair and extract the
# meaningful bits

# when you finally find the error in the stack trace, work backwards
# Study the error message,
# and try to walk backwards through the code to understand
#how the flow of the program arrived at the error condition

# Most important:
# Think about the various data that is being used at the point of the error,
# and how missing or incorrect data could have caused the problem.
# Finally, use a search engine to look up the error message.

# When entering the stack trace error make sure to not enter any specific
# variable names, for example in the following stack error trace:
# stack error trace => NoMethodError: undefined method 'name' for nil:NilClass
# You'd want to avoid entering the name part, 'name' as it is too specific
# We also might want to preface the message the stack error trace with
# 'Ruby' to give us even more exact results
# Search engine results will likely pick up generic results so DO NOT
# copy and paste the entire stack error trace

# the second place to help you debug is Stack overflow

# the third plaec to look is the official ruby documentation
# ------------------------------------------------------------------------------

def car(new_car)
  make = make(new_car)
  model = model(new_car)
  [make, model]
end

def make(new_car)
  new_car.split(" ")[0]
end

def model(new_car)
  new_car.split(" ")[2]
end

make, model = car("Ford Mustang")
make == "Ford"         # => true
model.start_with?("M") # => NoMethodError: undefined method `start_with?' for nil:NilClass
