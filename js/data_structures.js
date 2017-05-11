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

// Create a new constructor function for a car, with properties and various data types (including a function)

function Car(model, color, transmissionType, isFourDoor, cylinders) {

  this.model = model;
  this.color = color; 
  this.transmissionType = transmissionType;
  this.isFourDoor = isFourDoor;
  this.cylinders = cylinders
  this.honkHorn = function() { console.log('Honk! Honk!'); };

};

var carOne = new Car('Stargazer', 'red', 'manual', true, 6);
console.log(carOne);
carOne.honkHorn();
console.log('The color of this ' + carOne.model + ' car is ' + carOne.color + '.');

var carTwo = new Car('BeastMaster', 'black', 'automatic', false, 10);
console.log(carTwo);
carTwo.honkHorn();
console.log('The ' + carTwo.model + ' car has ' + carTwo.cylinders + ' cylinders in it!');

var carThree = new Car('Velor', 'white', 'automatic', true, 4);
console.log(carThree);
carThree.honkHorn();
console.log('This brand new ' + carThree.model + ' is a white model with an ' + carThree.transmissionType + ' transmission in it.');