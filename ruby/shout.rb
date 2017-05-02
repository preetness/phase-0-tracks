# module Shout
  
#   def self.yell_angrily(words)
#     words + '!!!' + ' :('
#   end

#   def self.yelling_happily(words)
#     'Yayyyy! ' + words + '!!!  :)'
#   end

# end

module Shout

  def yell_angrily(words)
    puts words + '!!!' + ' :('
  end

  def yelling_happily(words)
     puts 'Yayyyy! ' + words + '!!!  :)'
  end

end

class Coach
  include Shout
end


class Mother
  include Shout
end


coach = Coach.new
coach.yell_angrily('What are you doing?')
coach.yelling_happily('Great play!')

mom = Mother.new
mom.yell_angrily('Pick up your laundry!')
mom.yelling_happily('I love you!')