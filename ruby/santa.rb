class Santa

attr_reader :age, :ethnicity, :reindeer_ranking
attr_accessor :gender

def initialize(gender, ethnicity)
  @gender = gender
  @ethnicity = ethnicity
  @age = 0
  @reindeer_ranking = ['Rudolph', 'Dasher', 'Dancer', 'Prancer', 'Vixen', 'Comet', 'Cupid', 'Donner', 'Blitzen']
  puts "Initializing Santa instance..."
end

def speak
  puts "Ho, ho, ho! Haaaappy holidays!"
end


def eat_milk_and_cookies(cookie_type)
  puts "That was a good #{cookie_type} cookie!"
end

def celebrate_birthday
  @age += 1
end

def get_mad_at(reindeer_name)
  @reindeer_ranking.insert(-1, @reindeer_ranking.delete(reindeer_name))
end

end


mr_claus = Santa.new('male', 'Asian')
mr_claus.speak
mr_claus.eat_milk_and_cookies("chocolate chip")

santas = []

various_genders = ['male', 'female', 'none of your business', 'male', 'all of the above']
various_ethnicities = ['Indian', 'Chinese', 'none of your business', 'Russian', 'various']

various_genders.length.times do |i|
  santas << Santa.new(various_genders[i], various_ethnicities[i])
end

p mr_claus.age
p mr_claus.gender
p mr_claus.ethnicity
p mr_claus.reindeer_ranking
mr_claus.get_mad_at("Vixen")
p mr_claus.reindeer_ranking
mr_claus.celebrate_birthday
p mr_claus.age
mr_claus.gender = "all"
p mr_claus.gender
