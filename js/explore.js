// Reverse a Word

// We are going to write a function that takes in a word as an argument
var reverse= function (string) {
// Take the word and split it up into separate indexes in an array
  var split = string.split('')
// Have a container for the reversed word  
  var reversed = []
// Iterate through this word and store each letter into an array, backwards
  for(var i = 0; i < string.length; i++) {
// Here we remove the last element of the array and save it to a variable
    var firstElement = split.pop()
// Then we push the element (or letter in this case) to the end of the new array
    reversed.push(firstElement)
  }
// Join the new array together into a string and return the reversed word
  return reversed.join('')
};

console.log(reverse('Preet'))
console.log(reverse('hello'))
console.log(reverse('programming'))