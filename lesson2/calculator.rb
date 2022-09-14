# 1st refactoring we want to do:
# we want to put an => before our prompts, let's create a method for it

def prompt message
  Kernel.puts("=> #{message}")
end

def valid_number? n
  # to keep things simple, as long as n does NOT equal to zero
  n != 0
end

def valid_operator? o
  return o if o == 1 || o == 2 || o == 3 || o == 4
end

def operation_underway op
         case op
         when 1
           "adding.."
         when 2
           "subtracting.."
         when 3
           "multiplying"
         when 4
           "dividing.."
         end
end

prompt("Please enter your name.")
name = nil
loop do
  name = Kernel.gets.chomp()

  if name.empty?()
    process("You need to enter a valid name.")
  else
    break
  end
end

prompt("Hi #{name}, Welcome.") # since we don\'t want to greet the user every
# time.

loop do #this is going to be the main loop
  first_num = nil# or instead of this you can just initialize like this: first_num = ""
  loop do # here is our third refactoring in process
    prompt("Please enter your first number")
    first_num = Kernel.gets.chomp.to_i()
    if valid_number?(first_num)
      break
    else
      prompt("Hmm.. that doesn\'t look right. Keep trying.")
    end
  end
  # remember to initialize the var outside of loop to avoid loop do's variable scope
  second_num = nil
  loop do
    prompt("Please enter your second number")
    second_num = Kernel.gets.chomp.to_i()
    if valid_number?(second_num)
      break
    else
      puts "Hmm.. that doesn\'t look right. Please enter an appropriate integer."
    end
  end

  operator_prompt = <<-MSG # the three letters up here and down there can be any 3, they're just delimiters, they just need to match
    What operation would you like to perform?
    1) add
    2) subtract
    3) multiply
    4) divide
  MSG

  #initialize an empty operator value again
  operator = nil
  prompt("Please enter a operator 1) addition 2) subtraction 3) multiplication 4) division")
  loop do
    operator = Kernel.gets.chomp.to_i
    #here we are making sure that they enter the appropriate operator
    if valid_operator?(operator)
      break
    else
      prompt(operator_prompt)# Instead of this: prompt("Sorry, you must enter 1, 2, 3, or 4")
    end
  end

  # here we want to display a message of what operation we chose
  prompt(operation_underway(valid_operator?(operator)))

  result = case operator
           when 1
             first_num + second_num
           when 2
             first_num - second_num
           when 3
             first_num * second_num
           when 4
             first_num / second_num
           end
  prompt("Your result is #{result}")

  prompt("Do you want to perform another calculation?(Y to calculate again)")
  answer = Kernel.gets.chomp
  break unless answer.downcase().start_with?("y")
end

prompt("Thanks for playing!")


# SECOND refactoring we want to do:
# turn our if statement into a case statement
# As you can see, we mention operator a lot in our conditonals, so we can use
# case for the conditionals

# in our case statement we could just use Kernel.puts for every when clause
# but instead it is much easier to se our case stmnt to a variable and output
# the new variable



# THIRD refactoring we will do is, if you look at our flowchart,
# we are asked to keep asking the user for a number until they enter an
# appropriate number, if they do not then we ask again until they do

# we can also use
# w%(1 2 3 4) to create an integer of strings, this will be how we
# determine if the value they enter is indeed a number 1-4
# my value differs in that I changed the operator choice into a integer,
# I didn\'t leave it as a string
# Had I left it like a string, I would do the following:
=begin
  if %w(1 2 3 4).include?(operator)
    break
  else
    prompt("Must choose 1 2 3 or 4")
  end
=end
