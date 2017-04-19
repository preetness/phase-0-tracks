#Encrypt:

#-Pass in a string and replace the letters of the string with the next letter in the alphabet
#  -Also make it lowercase
#-Any space character should remain the same

def encrypt(str)
  i = 0
    while i < str.length
     if str[i] == " "
       str[i] = str[i]
     elsif str[i] == "z"
       str[i] = "a"
     else
       str[i] = str[i].next
     end
      i += 1 
    end
  str
end

#Decrypt:

def decrypt(str)
  i = 0
  alphabet = "abcdefghijklmnopqrstuvwxyz"
    while i < str.length
    str[i] = alphabet[alphabet.index(str[i]) -1]
    i += 1
    end
  str
end

#Add an Interface:

puts "Would you like to encrypt or decrypt a password?"
user_answer = gets.chomp

puts "What is the password?"
user_password = gets.chomp

if user_answer.downcase == "encrypt"
  encrypted = encrypt(user_password)
  puts "Your encrypted password is: #{encrypted}"
else
  decrypted = decrypt(user_password)
  puts "Your decrypted password is: #{decrypted}"
end
