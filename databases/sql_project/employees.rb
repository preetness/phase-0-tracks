require 'sqlite3'
require 'faker'
require 'colorize'

### BUSINESS LOGIC ###

db = SQLite3::Database.new('accounting.db')

employee_table = <<-SQL
  CREATE TABLE IF NOT EXISTS employees (
  id INTEGER PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  wage INT,
  title VARCHAR(255),
  last_four_ssn INT,
  business_id INT,
  FOREIGN KEY (business_id) REFERENCES businesses(id)
  );
SQL

businesses_table = <<-SQL
  CREATE TABLE IF NOT EXISTS businesses (
  id INTEGER PRIMARY KEY,
  name VARCHAR(255),
  industry VARCHAR(255)
  );
SQL

db.execute(employee_table)
db.execute(businesses_table)

### CREATE NEW EMPLOYEES ###

def create_employee(database, first_name, last_name, wage, title, last_four_ssn, business_id)
  database.execute("INSERT INTO employees (first_name, last_name, wage, title, last_four_ssn, business_id) VALUES (?, ?, ?, ?, ?, ?)", [first_name, last_name, wage, title, last_four_ssn, business_id])
end

def update_employee(database, field, last_four_ssn, new_value)
  database.execute("UPDATE employees SET #{field}=(?) WHERE last_four_ssn=(?)", [new_value, last_four_ssn])
end

def delete_employee(database, primary_key)
  database.execute("DELETE FROM employees WHERE id=(?)", [primary_key])
end

def print_specific_employee(database, last_four_ssn)
  employee = database.execute("SELECT * FROM employees WHERE last_four_ssn=(?)", [last_four_ssn])
    puts '*'.colorize(:red) * 30
    employee.map do |item|
      puts "Employee ID: #{item[0]}"
      puts "First Name: #{item[1]}"
      puts "Last Name: #{item[2]}"
      puts "Compensation: $#{item[3]}".to_s.reverse.gsub(%r{([0-9]{3}(?=([0-9])))}, "\\1,").reverse
      puts "Title: #{item[4]}"
    end
    puts '*'.colorize(:red) * 30
end

def print_all_employees(database)
  employee = database.execute("SELECT * FROM employees, businesses WHERE employees.business_id = businesses.id")
    puts '*'.colorize(:red) * 30
    employee.map do |item|
      puts "Employee ID: #{item[0]}"
      puts "First Name: #{item[1]}"
      puts "Last Name: #{item[2]}"
      puts "Compensation: $#{item[3]}".to_s.reverse.gsub(%r{([0-9]{3}(?=([0-9])))}, "\\1,").reverse
      puts "Title: #{item[4]}"
      puts "SSN Last Four: #{item[5]}"
      puts "Employer Name: #{item[8]}"
      puts "Employer Industry: #{item[9]}"
      puts '*'.colorize(:red) * 30
    end
end

def print_quick_list(database)
  employee = database.execute("SELECT employees.first_name, employees.last_name, employees.last_four_ssn FROM employees")
    puts '*'.colorize(:red) * 30
    employee.map do |item|
      puts "First Name: #{item[0]}"
      puts "Last Name: #{item[1]}"
      puts "SSN: #{item[2]}"
      puts '*'.colorize(:red) * 30
    end
end


### CREATE BUSINESSES ###

def create_business(database, name, industry)
  database.execute("INSERT INTO businesses (name, industry) VALUES (?, ?)", [name, industry])
end

def update_business(database, field, primary_key, new_value)
  database.execute("UPDATE businesses SET #{field}=(?) WHERE id=(?)", [new_value, primary_key])
end

def delete_business(database, primary_key)
  database.execute("DELETE FROM businesses WHERE id=(?)", [primary_key])
end

def print_all_businesses(database)
  businesses = database.execute("SELECT * FROM businesses")
    puts '*'.colorize(:red) * 30
    businesses.map do |item|
      puts "Business ID: #{item[0]}"
      puts "Business Name: #{item[1]}"
      puts "Business Industry: #{item[2]}"
      puts '*'.colorize(:red) * 30
    end
end

def print_specific_business(database, primary_key)
  businesses = database.execute("SELECT * FROM businesses WHERE id=(?)", [primary_key])
  puts '*'.colorize(:red) * 30
    businesses.map do |item|
      puts "Business ID: #{item[0]}"
      puts "Business Name: #{item[1]}"
      puts "Business Industry: #{item[2]}"
      puts '*'.colorize(:red) * 30
    end
end


# 20.times do 
#   create_employee(db, Faker::Name.first_name, Faker::Name.last_name, Faker::Number.between(20000, 1000000), Faker::Job.title, Faker::Number.number(4), Faker::Number.between(1, 10))
# end

# 10.times do 
# create_business(db, Faker::Company.name, Faker::Job.field)
# end

businesses = db.execute('SELECT * FROM businesses')
employees = db.execute('SELECT * FROM employees')

### USER INTERFACE ###

puts "WELCOME TO PWC EMPLOYEE/BUSINESS DATABASE. PLEASE ENTER YOUR USERNAME:"
username = gets.chomp

puts "HELLO, #{username.upcase} - GOOD TO SEE YOU AGAIN."

loop do 
  puts "WHICH OF THE FOLLOWING FUNCTIONS WOULD YOU LIKE TO PERFORM?"
  puts "IF FINISHED, PLEASE TYPE DONE"
  puts "*".colorize(:blue) * 40
  puts "1. Enter a new employee"
  puts "2. Update an employee's records"
  puts "3. Delete an employee"
  puts "4. Print out an employee list"
  puts "5. Enter a new business"
  puts "6. Update a business record"
  puts "7. Delete a business"
  puts "8. Print out a business list"
  puts "*".colorize(:blue) * 40
  selection = gets.chomp
    if selection.downcase == "done"
      break

    elsif selection.to_i == 1
      print_all_businesses(db)
      puts "What is the employee's first name?"
      first_name = gets.chomp.downcase.capitalize
      puts "What is the employee's last name?"
      last_name = gets.chomp.downcase.capitalize
      puts "What is the employee's title?"
      title = gets.chomp.split.map(&:capitalize).join(" ")
      puts "What is the employee's wage?"
      wage = gets.chomp.to_i
      puts "What are the employee's last four digits of their Social Security Number?"
      last_four_ssn = gets.chomp.to_i
      puts "What is the ID for the business that #{first_name} #{last_name} will be working for?"
      business_id = gets.chomp.to_i
      create_employee(db, first_name, last_name, wage, title, last_four_ssn, business_id)
      puts "The following employee has been added to the database:"
      print_specific_employee(db, last_four_ssn)
    
    elsif selection.to_i == 2
      print_quick_list(db)
      puts "Please enter the last four digits of the SSN of the employee you'd like to update:"
      last_four_ssn = gets.chomp.to_i
      puts "Here is what that employee's record currently looks like:"
      print_specific_employee(db, last_four_ssn)
      puts "What field would you like to change?"
      puts "1. First name"
      puts "2. Last name"
      puts "3. Wages"
      puts "4. Job title"
      puts "5. Last four digits of SSN"
      field_to_change = gets.chomp.to_i
      puts "Please enter the new value: "
      new_value = gets.chomp
        case field_to_change
        when 1
          update_employee(db, "first_name", last_four_ssn, new_value)
        
        when 2
          update_employee(db, "last_name", last_four_ssn, new_value)
        
        when 3
          update_employee(db, "wage", last_four_ssn, new_value.to_i)
        
        when 4
          update_employee(db, "title", last_four_ssn, new_value)
        
        when 5
          update_employee(db, "last_four_ssn", last_four_ssn, new_value.to_i)
        end
        puts "Here is your updated record: "
        print_specific_employee(db, last_four_ssn)

    elsif selection.to_i == 3
      print_quick_list(db)
      puts "Please enter the ID of the employee you would like to delete:"
      employee_id = gets.chomp.to_i
      delete_employee(db, employee_id)

    elsif selection.to_i == 4
      puts "Here is the current list of all employees:"
      print_all_employees(db)

    elsif selection.to_i == 5
      puts "What is the name of the business you would like to add?"
      business_name = gets.chomp.split.map(&:capitalize).join(" ")
      puts "What industry is this business aligned with?"
      industry = gets.chomp.split.map(&:capitalize).join(" ") 
      create_business(db, business_name, industry)
      puts "Here is the record for the business:"
      # Print specific business record here

    elsif selection.to_i == 6
      print_all_businesses(db)
      puts "What is the ID of the business you would like to update?"
      business_id = gets.chomp.to_i
      puts "What field would you like to change?"
      puts "1. Business name"
      puts "2. Industry"
      business_field_to_change = gets.chomp.to_i
      puts "Please enter the new value:"
      new_business_value = gets.chomp
        case business_field_to_change
        when 1
          update_business(db, "name", business_id, new_business_value)
        when 2
          update_business(db, "industry", business_id, new_business_value)
        end
        # Print specific business record here

    elsif selection.to_i == 7
        print_all_businesses(db)
        puts "What is the business ID number that you would like to delete?"
        business_id = gets.chomp.to_i
        delete_business(db, business_id)
        
    elsif selection.to_i == 8
      puts "Here is the current list of all businesses: "
      print_all_businesses(db)
    end 
end







