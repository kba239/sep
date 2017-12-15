require 'benchmark'

# This method takes n arrays as input and combine them in sorted ascending  order
def original(*arrays)
  combined_array = []
  arrays.each do |array|
    array.each do |value|
      combined_array << value
    end
  end

  sorted_array = [combined_array.delete_at(combined_array.length-1)]

  for val in combined_array
    i = 0
    while i < sorted_array.length
      if val <= sorted_array[i]
        sorted_array.insert(i, val)
        break
      elsif i == sorted_array.length - 1
        sorted_array << val
        break
      end
      i+=1
    end
  end

  # Return the sorted array
  sorted_array
end

arrayOne = [2, 5, 1, 13, 15, 19, 18, 16, 3, 6, 4]
arrayTwo = [11, 12, 10, 7, 9, 8, 14, 17, 20]
arrayThree = [21, 23, 22, 27, 29, 28, 24, 26, 25, 30]
arrayFour = [31, 33, 32, 37, 39, 38, 34, 36, 35, 40]

puts original(arrayOne, arrayTwo)
puts original(arrayOne, arrayTwo, arrayThree, arrayFour)
