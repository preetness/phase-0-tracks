class Santa

def initialize(gender, ethnicity)
  @gender = gender
  @ethnicity = ethnicity
  puts "Initializing Santa instance..."
end

def speak
  puts "Ho, ho, ho! Haaaappy holidays!"
end


def eat_milk_and_cookies(cookie_type)
  puts "That was a good #{cookie_type} cookie!"
end

def age
  0
end

reindeer_ranking = ['Rudolph', 'Dasher', 'Dancer', 'Prancer', 'Vixen', 'Comet', 'Cupid', 'Donner', 'Blitzen']


end


marcus = Santa.new
marcus.speak
marcus.eat_milk_and_cookies("chocolate chip")

santas = []

various_genders = ['male', 'female', 'none of your business', 'male', 'all of the above']
various_ethnicities = ['Indian', 'Chinese', 'none of your business', 'Russian', 'various']

various_genders.length.times do |i|
  santas << Santa.new(various_genders[i], various_ethnicities[i])
end

