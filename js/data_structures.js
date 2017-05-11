// Create an array of colors, and another of horses

var colors = ['blue', 'red', 'green', 'yellow'];

var names = ['Ed', 'Draymond', 'Ronald', 'John'];

// Add an additional color and horse to the corresponding array

colors.push('black');
names.push('Sven');

// Create an object, assign the horses to key names, and the values should be colors

var horseColors = function(horse, color) {
  var horseColors = {}
  for (var i = 0; i < horse.length; i++) {
        horseColors[horse[i]] = color[i]
    }
  console.log(horseColors)
};

horseColors(names, colors)