# WordGame Pseudocode

# Make a WordGame class
# Create an initialize method with takes in a single word
# Make instance variables that store the following:
    # Answer
    # The word in an array
    # The total number of guesses allowed
    # The letters guessed so far
    # The current game board
    # If the game is over or not
# Decrease the number of guesses after a letter is inputted
# Display the progress made after each turn
# Check each letter to make sure it isn't a repeated guess
# If it is a repeated guess, don't count that against the total guesses
# If it is a unique guess, check and see if it is in the word or not
    # If it is in the word, send that letter into the progress board, so user can see
# Continue to ask for another letter if the game is not over
# Congratulate user if wins, or taunt if they lose

### BUSINESS LOGIC ###

require 'colorize'

class WordGame

  attr_reader :guess_count, :game_over

  def initialize(string)
    @answer = string
    @word = string.split("")
    @guess_count = @word.length * 2
    @letters_guessed = []
    @word_progress = %w( _ ) * @word.length
    @game_over = false
  end 

# Store the letters guessed into an array
  def letters_to_array(letter)
    @letters_guessed << letter
  end

# Check to see if the letter has already been guessed
  def repeated_letter?(letter)
    check_letter(letter) if !@letters_guessed.include?(letter)
  end

# Check to see if the letter guessed is a part of the word played
  def check_letter(letter)
    letters_to_array(letter)
        @word.each_with_index do |char, index|
          if char == letter
            @word_progress[index] = char
          end
        end
      @guess_count -= 1
      letter
  end

# Provide feedback to player by showing current board
  def progress_update
    @word_progress.join(' ')
  end

#Check to see if the player has won
  def win
    if @word_progress.join('') == @answer
      @game_over = true
    end
  end

end

### USER INTERFACE ###

puts 'Welcome to WordGame!'.colorize(:red)
puts 'What word would you like your opponent to guess? Enter here:'
user_word = gets.chomp
game = WordGame.new(user_word)
puts 'What is your first name?'
  user_name = gets.chomp

until game.win || game.guess_count == 0 
  puts "#{user_name}, please guess a letter:".colorize(:blue)
    user2_guess = gets.chomp
    game.repeated_letter?(user2_guess)
  puts '******************************************'
  puts "The current board:" + " #{game.progress_update}".colorize(:red)
  puts "You currently have #{game.guess_count} guesses remaining!" if !game.win
  puts '******************************************'
  puts "Congratulations #{user_name}! You guessed '#{user_word}' correctly, and won the game!" if game.win
  puts "You have lost the game. Shame on you and your entire family!" if game.guess_count == 0

end 




