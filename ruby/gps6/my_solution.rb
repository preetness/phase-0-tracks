# Virus Predictor

# I worked on this challenge with: Alan English
# We spent 1.5 hours on this challenge.

# Explanation of require_relative:
# 'require_relative' is used when the file we are requiring is in the same relative path as our .rb file
# 'require' is used for outside files such as gems that we need

require_relative 'state_data'

class VirusPredictor
  # Initialize instance of class and pass thru STATE_DATA
  def initialize(state_of_origin, population_density, population)
    @state = state_of_origin
    @population = population
    @population_density = population_density
  end

  # Calls the #predicted_deaths and #speed_of_spread methods
  def virus_effects
    predicted_deaths
    speed_of_spread
  end

  private
  # Predicts deaths based on state population density   
  def predicted_deaths
    # Predicted deaths is solely based on population density
    num = case @population_density

    when (200..99999)
      0.4
    when (150..199)
      0.3
    when (100..149)
      0.2
    when (50..99)
      0.1
    else
      0.5
    end

    number_of_deaths = (@population * num).floor
    print "#{@state} will lose #{number_of_deaths} people in this outbreak"

  end
  # Method predicts the speed at which the virus will spread, using a case statement
  def speed_of_spread 

    # Speed indicates number of months
    speed = case @population_density

    when (200..99999)
      0.5
    when (150..199)
      1
    when (100..149)
      1.5
    when (50..99)
      2
    else
      2.5
    end

    puts " and will spread across the state in #{speed} months.\n\n"

  end

end

#=======================================================================

# DRIVER CODE

# Initialize VirusPredictor for each state

STATE_DATA.map do |state, state_data|
  VirusPredictor.new(state, state_data[:population_density], state_data[:population]).virus_effects
end

# alabama = VirusPredictor.new("Alabama", STATE_DATA["Alabama"][:population_density], STATE_DATA["Alabama"][:population])
# alabama.virus_effects

# jersey = VirusPredictor.new("New Jersey", STATE_DATA["New Jersey"][:population_density], STATE_DATA["New Jersey"][:population])
# jersey.virus_effects

# california = VirusPredictor.new("California", STATE_DATA["California"][:population_density], STATE_DATA["California"][:population])
# california.virus_effects

# alaska = VirusPredictor.new("Alaska", STATE_DATA["Alaska"][:population_density], STATE_DATA["Alaska"][:population])
# alaska.virus_effects

# REFLECTION

# One hash uses a string key value and uses a hashrocket to point to its value. The other uses symbols as the key.

# 'require_relative' is used when the file we are requiring is in the same relative path as our .rb file.

# 'require' is used for outside files such as gems that we need.

# The .each method is an effective tool to iterate through a hash.

# What struck us about #virus_effects was that the arguments were already passed in during initialization, so we did not need to use them as parameters in this method.

# Refactoring and making the code more DRY.
