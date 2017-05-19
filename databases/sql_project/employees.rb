require 'sqlite3'
require 'faker'

db = SQLite3::Database.new('accounting.db')

employee_table = <<-SQL
  CREATE TABLE IF NOT EXISTS employees (
  id INTEGER PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  wage INT,
  title VARCHAR(255)
  );
SQL

accountant_table = <<-SQL
  CREATE TABLE IF NOT EXISTS employees (
  id INTEGER PRIMARY KEY,
  employee_id INT,
  business_id INT,
  FOREIGN KEY (employee_id) REFERENCES employees(id),
  FOREIGN KEY (business_id) REFERENCES businesses(id)
  );
SQL

businesses_table = <<-SQL
  CREATE TABLE IF NOT EXISTS employees (
  id INTEGER PRIMARY KEY,
  name VARCHAR(255),
  industry VARCHAR(255)
  );
SQL

db.execute(employee_table)
db.execute(accountant_table)
db.execute(businesses_table)

def create_employee(database, first_name, last_name, wage, title)
  database.execute("INSERT INTO employees (first_name, last_name, wage, title) VALUES ('#{first_name}', '#{last_name}', '#{wage}', '#{title}')")
end

def update_employee(database, first_name, last_name, wage, title)
  
end

def delete_employee(database, primary_key)
  database.execute("DELETE FROM employees WHERE id=#{primary_key}")
end

#db.execute("INSERT INTO employees (first_name, last_name, wage, title) VALUES ('Preet', 'Dha', 1000000, 'Ruby Specialist')")
employees = db.execute('SELECT * FROM employees')
delete_employee(db, 1)
employees = db.execute('SELECT * FROM employees')
p employees