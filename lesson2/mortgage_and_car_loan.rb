require 'yaml'
HEHE = YAML.load_file('mortgage_program.yml')

def prompt n
  Kernel.puts("=> #{n}")
end

# create a method that will allow me to not have to write out each message each time
def message m,n
  m[n]
end

def loan_amount no # can either be a float, int, but no words
  # no = gets.chomp # if you have the input here then it always gets reset when we call method
  if no.to_i.to_s == no # if it is equal it is not a string.
    no = no.to_i # we turn our parameter into an int
  elsif no.include?('.') # this will handle floats
    no = no.to_f # makes parameter a float
  else # THE ELSE KEY WORD IS ONLY FOR FALSE VALUES
    if no.empty?
      # prompt(HEHE['empty'])
      prompt(message(HEHE,'empty'))
    else
      prompt(message(HEHE,'incorrect'))
    end
  end
end

def apr r # say the user can enter an integer or a float, but no strings
  # float must have a decimal in it, and must maintain its integerity

  # blocks strings                      blocks strings with decimal
  if r.to_i.to_s == r || r.include?('.') && r.to_f.eql?(r.to_f) && r.to_f != 0
    r = r.to_f # we want a FLOAT returned
  else
    if r.empty? then prompt(message(HEHE,'empty')) else prompt(message(HEHE,'incorrect')) end
  end
end

def loan_duration d
  if d.to_i.to_s == d # we can only accept whole numbers
    d = d.to_i
  else
    if d.empty? then prompt(message(HEHE,'empty')) else prompt(message(HEHE,'incorrect')) end
  end
end

# j = monthly interest rate
# n = loan duration in months
# p = total loan amount
def calculate j,p,n
  p * (j / (1 - (1 + j)**(-n)))
end

prompt(message(HEHE,'welcome'))
prompt(message(HEHE,'into'))

loop do # our main loop
  amount_of_loan = ""
  prompt(message(HEHE,'first_thing'))
  loop do
    amount_of_loan = gets.chomp # ask for input before we go to method
    if loan_amount(amount_of_loan) # in the case that it is considered true
      break
    end
  end

  rate = nil # we need to create rate outside of this loop so we can use it in other places out of the loop
  prompt(message(HEHE,'second_thing'))
  loop do
    rate = gets.chomp
    if apr(rate)
      break
    end
  end

  duration = nil
  prompt(message(HEHE,'third_thing'))
  loop do
    duration = gets.chomp
    if loan_duration(duration)
      break
    end
  end

  prompt(message(HEHE,'summary'))
  prompt(message(HEHE,'loan_amount_sum'))
  prompt("#{loan_amount(amount_of_loan)}")
  prompt(message(HEHE,'apr_rate_sum'))
  prompt("#{apr(rate)}%")
  prompt(message(HEHE,'loan_duration_sum'))
  prompt("#{loan_duration(duration)} year(s)")

  prompt(message(HEHE,'correct?'))
  correct_or_not = nil
  loop do
    correct_or_not = gets.chomp.downcase
    if correct_or_not.eql?("y") # keeps us going in the loop
      break
    end
    break
  end

  next if correct_or_not.eql?("n") # allows us to start from beg. of loop
  prompt(message(HEHE,'beep_boop'))

  monthly_int = (apr(rate)/100) / 12 # j
  loan_in_months = loan_duration(duration) * 12
  total_loan_amnt = loan_amount(amount_of_loan)

  prompt(calculate(monthly_int,total_loan_amnt,loan_in_months))
  prompt(message(HEHE,'try_again?'))
  prompt(message(HEHE,'y_or_n'))

  continue = nil
  loop do
    continue = gets.chomp
    if continue.downcase.eql?("no") || continue.downcase.eql?("yes")
      break
    else
      prompt(message(HEHE,'incorrect'))
    end
  end

  break if continue.eql?("no")
end
prompt(message(HEHE,'thanks!'))
