seahawks = {
  :management => {
    :owner => "Paul Allen",
    :general_manager => "John Schneider",
    :other_executives => ["Peter McLoughlin", "Chuck Arnold", "Karen Spencer", "David Young"]
  },
  :coaching_staff => {
    :head_coach => "Pete Caroll",
    :coordinators => ["Darrell Bevell", "Kris Richard"],
    :assistants => ["Tom Cable", "Michael Barrow", "Dwaine Board", "Chris Carlisle"]
  },
  :players => {
    :quarterbacks => ["Russell Wilson", "Trevone Boykin"],
    :running_backs => ["Eddie Lacy", "Thomas Rawls", "Alex Collins", "C.J. Prosise"],
    :pass_catchers => {
      :tight_ends => ["Jimmy Graham", "Luke Willson", "Nick Vannett"],
      :wide_receivers => ["Doug Baldwin", "Paul Richardson", "Jermaine Kearse", "Tyler Lockett"]
    }
  }
}

puts "The owner of the Seahawks is #{seahawks[:management][:owner]}"
puts "The GM of the Seahawks is #{seahawks[:management][:general_manager]}"
puts "The head coach of the Seahawks is #{seahawks[:coaching_staff][:head_coach]}"
puts "The defensive coordinator of the team is #{seahawks[:coaching_staff][:coordinators][1]}"
puts "A dynamic receiver for the team is #{seahawks[:players][:pass_catchers][:wide_receivers][0]}"