// Find the longest word in a given array of phrases or words

var longestWord = function(word_array) {
  longest = ''
  for (var i = 0; i < word_array.length; i++) {
    if (word_array[i].length > longest.length)  
      longest = word_array[i]   
  }
  return longest;
};

var keyValueMatch = function(object1, object2) {
  
};