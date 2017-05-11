#Write a method that swaps the first and last name

#Change all of the vowels (a, e, i, or u) to the next vowel in 'aeiou' and all of the consonants to the next consonant

def spy_name(name)

new_name = name.downcase.split(' ').reverse.join(' ').split('')
vowels = "aeiou".split("")
consonants = "bcdfghjklmnpqrstvwxyz".split("")

  spy = new_name.map do |letter|
    if letter == "u"
      letter = "a"
    elsif letter == "z"
      letter = "b"
    elsif letter == ' '
      letter = ' '
    elsif index = vowels.index(letter)
      letter = vowels[index+1]
    elsif index = consonants.index(letter)
      letter = consonants[index+1]
    end
  end
  p spy.join('').split.map(&:capitalize).join(' ')
end

spy_name('Felicia Torres')
