# Release 0
def take_block
  pair1 = "Kelsey"
  pair2 = "Preet"
  puts "Status message BEFORE the block!"
  yield(pair1, pair2)
  puts "Status message AFTER the block!"
end

take_block { |pair1, pair2| puts "One pair's name is #{pair1}, and the other is #{pair2}!" }

# Release 1
days = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]

states = {
  :bird => "Cardinal",
  :motto => "Go big or go home!",
  :racist_flag => false,
  :famous_person => "Kelsey Monroe"
}

days.each do |day|
  puts "Today is: #{day}"
end

states.each do |k, v|
  puts "New York state #{k} is #{v}"
end

days.map! do |day|
  puts " Yesterday was: #{day}"
  day.downcase
end

p days

# Release 2
sample_array = [1,2,3,4,5,6,7,8,9,10]

favorites = {
  song: "Thriller",
  color: "Orange",
  integer: 27,
  sports_team: "Sea Hawks"
}

# 1. A method that iterates through the items, deleting any that meet a certain condition (
# for example, deleting any numbers that are less than 5).

sample_array.delete_if { |x| x < 5 }

favorites.delete_if { |category, thing| thing != "Orange"}

# 2. A method that filters a data structure for only items that do satisfy a certain condition 
# (for example, keeping any numbers that are less than 5).

sample_array.sort.take_while { |x| x < 5 }

favorites.keep_if { |category, thing| thing != "Orange"}

# 3. A different method that filters a data structure for only items satisfying a certain condition -- Ruby offers several options!

sample_array.keep_if { |x| x < 5 }

favorites.select { |category, thing| thing != "Orange"}

# 4. A method that will remove items from a data structure until the condition in the block evaluates to false, 
# then stops (you may not find a perfectly working option for the hash, and that's okay).

sample_array.take_while { |x| x < 5 }

favorites.delete_if do |category, thing| 
    break if thing == "Orange"
    thing != "Orange"
end

# While we couldn't find one method to satisfy #4, we found that if we use #delete_if and include a 
# break if statement in our block, we can achieve the desired result.




