#Write a method that swaps the first and last name

#Change all of the vowels (a, e, i, or u) to the next vowel in 'aeiou' and all of the consonants to the next consonant

def reverse_name(arr)
  reversed_name = arr.split(' ').reverse.join(' ')
  reversed_name
end

def next_vowel(char)
  case char
  when 'a'
    char = 'e'
  when 'e'
    char = 'i'
  when 'i'
   char = 'o'
  when 'o'
   char = 'u'
  when 'u'
   char = 'a'
  end
  p char
end



