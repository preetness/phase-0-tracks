require 'sqlite3'
require 'faker'

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

def create_employee(database, first_name, last_name, wage, title, last_four_ssn, business_id)
  database.execute("INSERT INTO employees (first_name, last_name, wage, title, last_four_ssn, business_id) VALUES (?, ?, ?, ?, ?, ?)", [first_name, last_name, wage, title, last_four_ssn, business_id])
end

def update_employee(database, field, primary_key, new_value)
  database.execute("UPDATE employees SET #{field}=(?) WHERE id=(?)", [new_value, primary_key])
end

def delete_employee(database, primary_key)
  database.execute("DELETE FROM employees WHERE id=(?)", [primary_key])
end

def print_specific_employee(database, last_four_ssn)
  employee = database.execute("SELECT * FROM employees WHERE last_four_ssn=(?)", [last_four_ssn])
    puts '*' * 30
    employee.map do |item|
      puts "Employee ID: #{item[0]}"
      puts "First Name: #{item[1]}"
      puts "Last Name: #{item[2]}"
      puts "Compensation: $#{item[3]}".to_s.reverse.gsub(%r{([0-9]{3}(?=([0-9])))}, "\\1,").reverse
      puts "Title: #{item[4]}"
      puts "SSN Last Four: #{item[5]}"
    end
    puts '*' * 30
end

def print_all_employees(database)
  employee = database.execute("SELECT * FROM employees")
    puts '*' * 30
    employee.map do |item|
      puts "Employee ID: #{item[0]}"
      puts "First Name: #{item[1]}"
      puts "Last Name: #{item[2]}"
      puts "Compensation: $#{item[3]}".to_s.reverse.gsub(%r{([0-9]{3}(?=([0-9])))}, "\\1,").reverse
      puts "Title: #{item[4]}"
      puts "SSN Last Four: #{item[5]}"
      puts '*' * 30
    end
end

# 35.times do 
#   create_employee(db, Faker::Name.first_name, Faker::Name.last_name, Faker::Number.between(20000, 1000000), Faker::Job.title, Faker::Number.number(4), Faker::Number.between(1, 20))
# end

def create_business(database, name, industry)
  database.execute("INSERT INTO businesses (name, industry) VALUES (?, ?)", [name, industry])
end

def update_business(database, field, primary_key, new_value)
  database.execute("UPDATE businesses SET #{field}=(?) WHERE id=(?)", [new_value, primary_key])
end

def delete_business(database, field, search_value)
  database.execute("DELETE FROM businesses WHERE #{field}=(?)", [search_value])
end

# 20.times do 
# create_business(db, Faker::Company.name, Faker::Job.field)
# end

businesses = db.execute('SELECT * FROM businesses')

employees = db.execute('SELECT * FROM employees')

# p employees
# p businesses



print_employee(db)










