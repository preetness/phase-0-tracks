#Initialize an array

sample_array = []

#Manipulate array 

sample_array << 2 
sample_array << 4

#Access array 

sample_array[1]

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

puts "Would you like to update a key? (y/n)"
update = gets.chomp

if update == 'y'
  puts "Please enter the key you want to update:"
  update_this_key = gets.chomp.to_sym
  puts "What is the new key name?"
  new_key = gets.chomp.to_sym
end

job_application[new_key] = job_application.delete(update_this_key)

p job_application
