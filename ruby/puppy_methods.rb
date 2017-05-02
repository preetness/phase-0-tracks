class Puppy

  def initialize
    puts 'Initializing new puppy instance ...'
  end

  def fetch(toy)
    puts "I brought back the #{toy}!"
    toy
  end

  def speak(int)
    int.times { puts 'Woof!'}
  end

  def roll_over
    puts '*rolls over*'
  end

  def dog_years(int)
    p int * 7
  end

  def jump(int)
    puts "The dog just jumped #{int} times!"
  end

end


puppy = Puppy.new
puppy.fetch('ball')
puppy.speak(5)
puppy.roll_over
puppy.dog_years(5)
puppy.jump(100)

class Zoo

  def initialize(animal, age)
    @animal = animal
    @age = age
  end

  def swim(int)
    puts "This #{@age} year old #{@animal} can swim #{int} feet."
  end

  def eat(int)
    puts "This #{@animal} eats #{int} times a day."
  end
end

zoo_animal = []

50.times do
  zoo_animal << Zoo.new("monkey", 2)
end

zoo_animal.each do |animal|
  animal.swim(100)
  animal.eat(3)
end

p zoo_animal