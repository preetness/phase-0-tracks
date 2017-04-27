#Prompt user for name

puts "What is your full name?"
name = gets.chomp

#Prompt user for age

puts "What is your age?"
age = gets.to_i

#Prompt user for email address

puts "What is your email address?"
email = gets.chomp

#Prompt user for number of children

puts "How many children do you have?"
num_children = gets.to_i

#Prompt user for decor theme

puts "What sort of theme would you prefer?"
theme = gets.chomp

#Ask user if they are currently employed (y/n)

puts "Are you currently employed?"
employed = gets.chomp
if employed == 'y'
  employed = true
else
  employed = false
end

#Ask user if they will be able to begin within two weeks (y/n)

puts "Can you begin work within two weeks?"
start_date = gets.chomp
if start_date == 'y'
  start_date = true
else
  start_date = false
end

job_application = {
  :name => name,
  :age => age ,
  :email => email,
  :num_children => num_children,
  :theme => theme,
  :employed => employed,
  :start_date => start_date
}

p job_application
