require "yaml"
MESSAGES = YAML.load_file('message_config.yml')
# at top of file after initializing MESSAGES

def messages lang='en', message
  MESSAGES[lang][message]
end

# First thing to work on:
# Better integer validation. Our current method valid_number? is weak as
# We cannot enter a zero

def prompt message
  Kernel.puts("=> #{message}")
end

=begin
def integer?(input)
  tru = input.to_i.to_s == input # say we enter "lol" itll give us "0", is that equal to "lol"?
end
=end

def number? n # this will make sure only ints or floats are used in our program
  # we get input
  # is it float or int? No its a string
  # ok so convert str to integer and float and compare it to how it looked as a string?
  if n.include?(".") # this is for floats
    n = n.to_f
    n
  elsif n.to_i.to_s == n # this is for ints
    n = n.to_i
    n
  end
  # if it is not an integer or float
end

def valid_operator? o
  return o if o == 1 || o == 2 || o == 3 || o == 4
end

def operation_underway op # the operation_to_message method
 caser = case op
         when 1
           messages("es","add")
         when 2
           messages('subtract')
         when 3
           messages('multiply')
         when 4
           messages("es","divide")
         end

         "Thie is just random code :)" # this is what would be returned

         return caser # this would just return a number

         "Even more random code, just wanted to make sure line 49 works!"
end

# replaced this: prompt("Please enter your name.")
# with this
prompt(messages("es","welcome"))
name = nil
loop do
  name = Kernel.gets.chomp()
  if name.empty?()
    prompt(messages("es","valid_name"))
  else
    break
  end
end

prompt(messages("es","greeting") + " #{name}!") # since we don\'t want to greet the user every
# time.

loop do # this is going to be the main loop
  first_num = nil # or instead of this you can just initialize like this: first_num = ""
  loop do # here is our third refactoring in process
    prompt(messages("es","first_entry"))
    first_num = Kernel.gets.chomp
    if number?(first_num)
      break
    else
      prompt(messages("es",'invalid_entry'))
    end
  end
  # remember to initialize the var outside of loop to avoid loop do's variable scope
  second_num = nil
  loop do
    prompt(messages("es",'second_entry'))
    second_num = Kernel.gets.chomp
    if number?(second_num)
      break
    else
      prompt(messages("es",'invalid_entry'))
    end
  end

  operator_prompt = <<-MWF # the three letters up here and down there can be any 3, they're just delimiters, they just need to match
    What operation would you like to perform?
    1) add
    2) subtract
    3) multiply
    4) divide
  MWF

  # initialize an empty operator value again
  operator = nil
  prompt(operator_prompt) # here we ask what operation they want to perform
  loop do
    operator = Kernel.gets.chomp.to_i
    # here we are making sure that they enter the appropriate operator
    if valid_operator?(operator)
      break
    else
      prompt(messages("es",'invalid_operation'))
      Kernel.puts(operator_prompt)
    end
  end

  # here we want to display a message of what operation we chose
  prompt(operation_underway(valid_operator?(operator)))
  # we have our valid_operator?(operator)
  # our valid_operator method returns the number (1,2,3,4) that the user enters
  # the arg we pass into valid_operator? is from the operator variable which is
  # a number, remember that 1,2,3,4
  # the operation_underway variable uses the number from our valid_operator method
  # in order to please the different possibilities of our case

  result = case operator
           when 1
             number?(first_num) + number?(second_num)
           when 2
             number?(first_num) - number?(second_num)
           when 3
             number?(first_num) * number?(second_num)
           when 4
             number?(first_num) / number?(second_num)
           end
  prompt(messages("es",'result')+ "#{result}")

  prompt(messages("es",'again?'))
  answer = Kernel.gets.chomp
  break unless answer.downcase().start_with?("y")
end

prompt(messages("es",'goodbye'))
