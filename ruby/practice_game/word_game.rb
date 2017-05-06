# WordGame Pseudocode
# - def WordGame class
# - def initialize instance method with string parameter (only one word allowed)
#   - create initial state variables for string (to be converted to array), guess count,
#     and letters guessed array
# - def maximum guesses allowed count by length of word
# - def decrease guess count method
# - def progress display method
# - def guesses made method that moves previous guesses into array
# - def check letter method
#   - decrease guess count by 1, unless guess is correct
#   - display correctly guessed letter in progress display
#   - continue to ask for another letter if word game not over
# - congratulate user if wins, or taunt if loses

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

  def letters_to_array(letter)
    @letters_guessed << letter
  end

  def repeated_letter?(letter)
    check_letter(letter) if !@letters_guessed.include?(letter)
  end

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

  def progress_update
    @word_progress.join(' ')
  end

  def win
    if @word_progress.join('') == @answer
    @game_over = true
    end
  end

  def word_guess(word)
    if word == @word.join('') 
      @game_over = true
    end
  end


end

### USER INTERFACE ###

puts 'Welcome to WordGame!'
puts 'What word would you like your opponent to guess? Enter here:'
user_word = gets.chomp
game = WordGame.new(user_word)
puts 'What is your first name?'
user_name = gets.chomp

until game.win || game.guess_count == 0 
puts "#{user_name}, please guess a letter:"
user2_guess = gets.chomp
game.repeated_letter?(user2_guess)
puts "The current board: #{game.progress_update}"
puts "You currently have #{game.guess_count} guesses remaining!" if !game.win
puts "Congratulations #{user_name}! You guessed '#{user_word}' correctly, and won the game!" if game.win
puts "You have lost the game. Shame on you and your entire family!" if game.guess_count == 0
end 




