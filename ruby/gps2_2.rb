# Method to create a list
# input: string of items separated by spaces (example: "carrots apples cereal pizza")
# steps: Take some words, and convert it into a grocery shopping list.
  # [fill in any steps here]
  # set default quantity to one
  # print the list to the console [can you use one of your other methods here?]
# output: a hash of grocery list items

def create_grocery_list(items)
  grocery_list = {}
  items.split(' ').each { |item| grocery_list[item] = 1 }
  grocery_list
end

list = create_grocery_list("carrots apples cereal pizza")

# Method to add an item to a list
# input: list, item name, and optional quantity
# steps: Add items to the list, using the name and quantity
# output: An item that we add to the list

def add_item(list, item, quantity = 1)
  list[item] = quantity
  p list
end

add_item(list, "squash", 5)

# Method to remove an item from the list
# input:
# steps:
# output: An updated hash without the item removed

# Method to update the quantity of an item
# input:
# steps:
# output: An updated hash with the new quantity

# Method to print a list and make it look pretty
# input:
# steps:
# output: A "prettier" grocery list