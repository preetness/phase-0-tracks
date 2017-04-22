def vampire

current_year = 2017
employee_allergy = nil

puts "How many employees will be processed in this survey?"
num_of_employees = gets.to_i

counter = 0

while counter < num_of_employees  

  puts "What is your name, employee number #{counter}?"
  vampire_name = gets.chomp

  puts "How old are you, #{vampire_name}?"
  vampire_age = gets.to_i

  puts "What year were you born?"
  vampire_year = gets.to_i

  puts "Our company cafeteria serves garlic bread. Should we order some for you?"
  garlic_bread = gets.chomp
  if garlic_bread.downcase == "no"
    garlic_bread = false 
  else
    garlic_bread = true 
  end

  puts "Would you like to enroll in the company’s health insurance?"
  health_insurance = gets.chomp
  if health_insurance.downcase == "no"
    health_insurance = false 
  else 
    health_insurance = true 
  end 

  puts "Please list your allergies. When you are finished listing your allergies, type 'done'."
  until employee_allergy == "sunshine" || employee_allergy == "done"
    employee_allergy = gets.chomp
  end

  if employee_allergy == "sunshine"
    puts "Probably a vampire."
  else
    puts "Results inconclusive."
  end

  if vampire_name == "Drake Cula" || vampire_name == "Tu Fang"
    puts "Definitely a vampire."
    
  elsif current_year - vampire_year == vampire_age && (garlic_bread || health_insurance)
    puts "Probably not a vampire."


  elsif current_year - vampire_year != vampire_age && (!garlic_bread || !health_insurance)
    puts "Probably a vampire."


  elsif current_year - vampire_year != vampire_age && (garlic_bread && health_insurance)
    puts "Almost certainly a vampire."
  end

  counter += 1
end
end

vampire