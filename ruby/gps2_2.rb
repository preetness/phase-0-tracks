# Method to create a list
# input: string of items separated by spaces (example: "carrots apples cereal pizza")
# steps: Take some words, and convert it into a grocery shopping list.
  # [fill in any steps here]
  # set default quantity to one
  # print the list to the console [can you use one of your other methods here?]
# output: a hash of grocery list items

def create_list(items)
  list = {}
  items.split(' ').each { |item| add_item(list, item) }
  list
end


# Method to add an item to a list
# input: list, item name, and optional quantity
# steps: Add items to the list, using the name and quantity
# output: An item that we add to the list

def add_item(list, item, quantity = 1)
  list[item] = quantity
  list
end

# Method to remove an item from the list
# input:
# steps:
# output: An updated hash without the item removed

def remove_from_list(list, item)
  list.delete_if {|key, value| key == item}
  list
end

# Method to update the quantity of an item
# input:
# steps:
# output: An updated hash with the new quantity

def update_quantity(list, item, quantity)
  add_item(list, item, quantity)
  list
end

# Method to print a list and make it look pretty
# input:
# steps:
# output: A "prettier" grocery list

def print_list(list)
  list.each do |key, value| 
    puts "#{key}: #{value}"
  end
end

list = create_list("carrots apples cereal pizza")
#print_list(list)
add_item(list, 'squash', 5)
add_item(list, 'oranges', 7)
#print_list(list)
remove_from_list(list, 'squash')
update_quantity(list,'carrots', 10)
print_list(list)

