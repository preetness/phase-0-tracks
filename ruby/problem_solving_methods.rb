#Release 0

#Define a method that takes one integer argument
#Method should generate and return an array of the terms of the Fibonacci sequence


def fibonacci(int)
  #Initialize array with the first 3 elements
  arr = [0, 1, 1]
  index = 2
  int.times{|i|
    #Add the current number and previous number of array
    i = arr[index] + arr[index - 1]
    #Push the sum into the array
    arr << i 
    index +=1
  }
 puts arr 
end 

fibonacci(100)

#Release 1

# Write a method that takes an array of integers and a number to search for
# Method should return the index of the number 
# Otherwise, return nil 
# Do not use .index

def search_array(array, number)
    #Does the array include the number given?
    if array.include?(number)
      #If so, assign that index to the variable
      number = (0..array.length - 1).select{|i| array[i] == number} 
    else
      nil
    end
  #Return the index number
  number
end

arr = [1,2,3,4,5]
puts search_array(arr, 2 )

#Release 2

#Sorting an Array

def bubble_sort(array)
  n = array.length
  loop do 
    swapped = false
    #Iterate through the array
    (n-1).times do |i|
      #If the array index being compared to the next is greater
      if array[i] > array[i+1]
        #Swap positions
        array[i], array[i+1] = array[i+1], array[i]
        swapped = true
      end
    end
    break if not swapped
  end
  array
end

a = [1, 4, 1, 3, 4, 5, 3, 3]
p bubble_sort(a)