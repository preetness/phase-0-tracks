# RSPEC FOR WORDGAME
require_relative 'word_game'

describe WordGame do
  let(:word) { WordGame.new("horse") }

  it "checks if a letter has already been used" do
    #word.repeated_letter?('h')
    expect(word.repeated_letter?('h').join('')).to eq 'h'
  end

  it "checks to see if guess is correct" do
    expect(word.check_letter('h')).to eq ('h')
  end

  it "stores guesses user has made" do
    word.check_letter("h")
    expect(word.letters_guessed).to eq ["h"]
  end

  it "decrease guesses remaining by one" do
    word.check_letter('o')
    expect(word.guess_count).to eq 9
  end

  it "updates user on current progress" do
    word.check_letter("h")
    expect(word.progress_update).to eq "h _ _ _ _"
  end

  it "displays if user won the game" do
    expect(word.answer).to eq 'horse'
  end

  it "displays if user lost the game" do
    1..10.times do word.check_letter('a'..'z').to_a.sample end
    expect(word.guess_count).to eq 0
  end

end