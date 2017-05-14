// RELEASE 0

// Find the longest word in a given array of phrases or words

var longestWord = function(word_array) {
  longest = ''
  for (var i = 0; i < word_array.length; i++) {
    if (word_array[i].length > longest.length)  
      longest = word_array[i]   
  }
  return longest;
};

console.log(longestWord(["andrewDBC","glennaDBC","Tyler is my advisor for Phase 0 at DBC"]));
console.log(longestWord(["long phrase","longest phrase","longer phrase"]));
console.log(longestWord(["simple phrase","a longer phrase","this is the longest phrase, for sure"]));



// var doKeyValueMatch = function(objectOne, objectTwo) {
//   for (var i = 0; i < objectOne.length; i++) {
//     if objectOne[i] == objectTwo[i]
//        return true;
//     else
//        return false;
//   }
// };

// doKeyValueMatch({name: "Steven", age: 54}, {name: "Tamir", age: 54});

// RELEASE 2

// Write a function that generates a random word and puts it into an array, a specified number of times

var generateOneWord = function(){
  var alphabet = 'abcdefghijklmnopqrstwxyz';
  var randomNumber = Math.floor((Math.random() * 10) + 1);
     var randomWord = '';
      for(var i = 0; i < randomNumber; i++) {
        index = Math.floor(Math.random() * alphabet.length);
        randomWord += alphabet.charAt(index);
      }
      return randomWord;
};

var generateTests = function(int) {
  var wordsArray = [];
    while(wordsArray.length < int) {
        wordsArray.push(generateOneWord());
    } 
    console.log('These are the ' + int + ' random strings that were generated: '+ wordsArray);
    return wordsArray;
};


generateTests(3);
console.log('The longest word from this array is: ' + longestWord(generateTests(3)));