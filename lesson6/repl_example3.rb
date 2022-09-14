require 'pry'

# So the `gets` method is representing 'Read' in REPL acronym
# The eval method is representing the 'Evalutate' in REPL
# The p method is representing the 'Print' in REPL
# The loop method is representing the 'Loop' in REPL
loop do
  p eval gets
  binding.pry
end


# More examples of eval
eval '2 + 2' # => returns integer 4
