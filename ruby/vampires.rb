puts 'How many employees will we be processing today?'
employee_count = gets.chomp.to_i
counter = 0
until counter == employee_count

puts "What is employee ##{counter + 1}'s name?"
name = gets.chomp.downcase
case name
when "drake cula", "tu fang"
  vampname = true
else
  vampname = false
end

puts 'How old are you?'
age = gets.chomp.to_i

puts 'What year were you born?'
year_born = gets.chomp.to_i 

correct_age = Time.now.year - year_born
  if correct_age == age
    accurate_age = true
  else
    accurate_age = false 
  end

puts 'Our company cafeteria serves garlic bread. Would you like to order some? (y or n)'
garlic_bread = gets.chomp.downcase
  case garlic_bread
  when "y", "yes", "sure", "obvi", "duh"
    garlic_bread = true
  else
    garlic_bread = false
  end
  
puts "Would you like to enroll in our company's health insurance? (y or n)"
insurance = gets.chomp.downcase
  case insurance
  when "y", "yes", "sure", "obvi", "duh"
    insurance = true
  else
    insurance = false
  end
  
puts "Please name any allergies you have, please type 'done' when finished."
  allergies = nil
  until allergies == "done" || allergies == "sunshine"
  allergies = gets.chomp.downcase
  
  
  

  if allergies == "sunshine"
    result = "Probably a vampire."
  else
    result = "Results inconclusive."
    if accurate_age && (garlic_bread || insurance)
      result = "Probably not a vampire."
    end
    if (!accurate_age && (!garlic_bread || !insurance)) 
      result = "Probably a vampire."
    end    
    if !accurate_age && !garlic_bread && !insurance
      result = "Almost certainly a vampire."
    end
    if vampname
      result = "Definitely a vampire!"
    end
  end 
  end
counter += 1
p result
end

puts "Actually, never mind! What do these questions have to do with anything? Let's all be friends."
